options.elasticsearch.js
========================
es terms
--------
###analyzed
*   broken down into searchable terms; including breaking into 'tokens'

###not_analyzed
*   did not go through any analysis process & is not broken down into tokens

### index:analyzed
*   setting index's value to analyzed for a field stores the analyzed form of the field in the db,
    rather than the pure form

### index:not_analyzed
*   field is still searchable, but didn't go thru any analysis, & isn't broken down into tokens

###store:true
*   field stored in index to later retrieve via selective loading when searching

###refresh
*   makes your documents available for search, but doesn't ensure they're written to persistent
    storage (it doesn't call fsync) & thus doesn't guarantee durability.

###flush (lucene commit)
*   a lucene commit is like elasticsearch's refresh, but it actually stores the documents.
*   flush forces a lucene commit. This is extremely expensive (slow, etc.).

entities
--------

### refreshOnSave
* refreshes index when new case saved

### customAnalyzers
#### case_insensitive_keyword
* ignores case, Only matches on full words?

### indexedAttributes
* what happens to items not put in here? Do they not get indexed at all? If so, how
  is that different from the ``index: 'not_analyzed'`` property?

#### indexedAttributes: possible content:
##### fieldname containing true

			'caseTitle': true

	*   This means index the attribute, and do so normally (?)


##### fieldname, containing type and index - e.g.:

		'id': {
			type: 'string',
			index: 'not_analyzed'
		},

*   Index this field, so it is searchable, but index the value exactly as specified. Do not
    analyze it. This is used for sorting.


##### fieldname with type & fields; w/ fields containing 'raw', which contains type & index

				'caseNumber': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							index: 'not_analyzed'
						}
					}
				},

*   A new caseNumber.raw subfield now exists that is not_analyzed, which makes it ideal for sorting.
    Referenced e.g. in cases-view.js, with the gridColumns property:

						gridColumns: [
							{
								title: utils.translateKey('case_number'),
								value: 'caseNumber',
								sort: 'caseNumber.raw'
							},

*   An analyzed form of 'caseNumber' also exists - named 'caseNumber.' This is used in
		'value'; whereas 'caseNumber.raw' is used in 'sort'

##### fieldname containing type:boolean

			'restrictedCase': {
				type: 'boolean'
			},

* stores the field in the db as a boolean