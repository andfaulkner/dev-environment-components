/***************************************************************************************************
*
*       Note that this  mostly inherits elasticsearch's api
*
*/
module.exports = {
	refreshOnSave: true,
	customAnalyzers: {
		'case_insensitive_keyword': {
			'tokenizer': 'keyword',
			'filter': ['lowercase']
		}
	},
	entities: [{
			base: 'sys',
			name: 'case',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseNumber': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							index: 'not_analyzed'
						}
					}
				},
				'assignedBy': {
					type: 'string',
					index: 'not_analyzed'
				},
				'assignedTo': {
					type: 'string',
					index: 'not_analyzed'
				},
				///////////////// POTENTIALLY REMOVABLE /////////////////
				'categoryLevel1': {
					type: 'string',
					index: 'not_analyzed'
				},
				'categoryLevel2': {
					type: 'string',
					index: 'not_analyzed'
				},
				'categoryLevel3': {
					type: 'string',
					index: 'not_analyzed'
				},
				/////////////////////////////////////////////////////////
				'caseTitle': true,
				'closeDate': true,
				'closeReason': true,
				'reopenReason': true,
				'cancelDate': true,
				'caseStatus': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'parent': true,
				'userBlacklist': {
					type: 'string',
					index: 'not_analyzed'
				},
				'owner': {
					type: 'string',
					index: 'not_analyzed'
				},
				'ownerName': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'investigativeTeamMembers': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdDate': true,
				'declineReason': true,
				'reassignReason': true,
				'isActiveRecord': {
					type: 'boolean'
				},
				//////////////MINE////////////
				//Adding Searchability on isConfidential, complaintType, complaintDescription
				//
				'isConfidential': {
					type: 'boolean'
				},
				'complaintType': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'not_analyzed'
						}
					}
				},
				'complaintTopic': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'not_analyzed'
						}
					}
				},
				'complaintDescription': {
					type: 'string',
					index: 'not_analyzed'
				},
				'reportCompleteOrRequiringEscalation': true,
				'employeeTypeInvolved': true

				//////////////////////////////
			}
		},
		//*******************************************************

		{
			base: 'sys',
			name: 'todo',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseNumber': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							index: 'not_analyzed'
						}
					}
				},
				'caseType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'title': {
					type: 'string',
					analyzer: 'case_insensitive_keyword'
				},
				'caseData': {
					type: 'object',
					properties: {
						'caseStatus': {
							type: 'string',
							index: 'not_analyzed'
						},
						'caseType': {
							type: 'string',
							index: 'not_analyzed'
						},
						'owner': {
							type: 'string',
							index: 'not_analyzed'
						},
						'investigativeTeamMembers': {
							type: 'string',
							index: 'not_analyzed'
						},
						'userBlacklist': {
							type: 'string',
							index: 'not_analyzed'
						}
					}
				},
				'number': true,
				'details': true,
				'todoType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'other': true,
				'responsible': {
					type: 'string',
					index: 'not_analyzed'
				},
				'responsibleName': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'due': true,
				'emailReminder': true,
				'dateCompleted': true,
				'dateAccepted': true,
				'isActiveRecord': {
					type: 'boolean'
				},
				'status': true,
				'createdBy': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdByName': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'assignedBy': {
					type: 'string',
					index: 'not_analyzed'
				},
				'assignedByName': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'createdDate': true
			}
		}, {
			base: 'sys',
			name: 'comment',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'parentId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'parentType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'parentNumber': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdBy': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdDate': true,
				'details': true,
				'caseId': {
					type: 'string',
					index: 'not_analyzed'
				}
			}
		}, {
			base: 'sys',
			name: 'note',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseNumber': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							index: 'not_analyzed'
						}
					}
				},
				'caseType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseData': {
					type: 'object',
					properties: {
						'caseStatus': {
							type: 'string',
							index: 'not_analyzed'
						},
						'caseType': {
							type: 'string',
							index: 'not_analyzed'
						},
						'owner': {
							type: 'string',
							index: 'not_analyzed'
						},
						'investigativeTeamMembers': {
							type: 'string',
							index: 'not_analyzed'
						},
						'userBlacklist': {
							type: 'string',
							index: 'not_analyzed'
						}
					}
				},
				'number': true,
				'details': true,
				'noteType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdBy': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdByName': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'createdDate': true,
				'isActiveRecord': {
					type: 'boolean'
				}
			}
		}, {
			base: 'sys',
			name: 'attachment',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseData': {
					type: 'object',
					properties: {
						'caseStatus': {
							type: 'string',
							index: 'not_analyzed'
						},
						'caseType': {
							type: 'string',
							index: 'not_analyzed'
						},
						'openedByBusinessGroup': {
							type: 'string',
							index: 'not_analyzed'
						},
						'owner': {
							type: 'string',
							index: 'not_analyzed'
						},
						'investigativeTeamMembers': {
							type: 'string',
							index: 'not_analyzed'
						},
						'userBlacklist': {
							type: 'string',
							index: 'not_analyzed'
						},
						'systemBlacklist': {
							type: 'string',
							index: 'not_analyzed'
						},
						'restrictedCase': {
							type: 'boolean'
						},
						'isConfidential': {
							type: 'boolean'
						},
						'privilegedCase': {
							type: 'boolean'
						},
						'tatCase': {
							type: 'boolean'
						},
						'caseCountry': {
							type: 'string',
							index: 'not_analyzed'
						},
						'caseRegion': {
							type: 'string',
							index: 'not_analyzed'
						},
						'caseSubregion': {
							type: 'string',
							index: 'not_analyzed'
						}
					}
				},
				'parentId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'parentType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'number': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseNumber': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							index: 'not_analyzed'
						}
					}
				},
				'kind': {
					type: 'string',
					index: 'not_analyzed'
				},
				'fileType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'description': true,
				'files': {
					type: 'object',
					properties: {
						name: { copy_to: 'fileNames', type: 'string' },
						content: { type: 'attachment' }
					}
				},
				'fileNames': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'templateId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'templateName': {
					type: 'string',
					index: 'not_analyzed'
				},
				'templateLocale': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdDate': true,
				'createdBy': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdByName': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'isActiveRecord': {
					type: 'boolean'
				}
			}
		}, {
			base: 'sys',
			name: 'party',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseNumber': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							index: 'not_analyzed'
						}
					}
				},
				'caseData': {
					type: 'object',
					properties: {
						'caseStatus': {
							type: 'string',
							index: 'not_analyzed'
						},
						'caseType': {
							type: 'string',
							index: 'not_analyzed'
						},
						'owner': {
							type: 'string',
							index: 'not_analyzed'
						},
						'investigativeTeamMembers': {
							type: 'string',
							index: 'not_analyzed'
						},
						'userBlacklist': {
							type: 'string',
							index: 'not_analyzed'
						}
					}
				},
				'partyType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'number': true,
				'firstName': {
					type: 'string',
					analyzer: 'case_insensitive_keyword'
				},
				'lastName': {
					type: 'string',
					analyzer: 'case_insensitive_keyword'
				},
				'middleInitial': true,
				'nickname': true,
				'dateOfBirth': true,
				'city': true,
				'address': true,
				'stateProvince': {
					type: 'string',
					index: 'not_analyzed'
				},
				'zipCodePostalCode': true,
				'homePhone': true,
				'workPhone': true,
				'cellPhone': true,
				'emailAddress': true,
				'lastNameOfRepresentative': true,
				'createdBy': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdByName': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'createdDate': true,
				'isActiveRecord': {
					type: 'boolean'
				}
			}
		}, {
			base: 'sys',
			name: 'email',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseData': {
					type: 'object',
					properties: {
						'caseStatus': {
							type: 'string',
							index: 'not_analyzed'
						},
						'caseType': {
							type: 'string',
							index: 'not_analyzed'
						},
						'openedByBusinessGroup': {
							type: 'string',
							index: 'not_analyzed'
						},
						'owner': {
							type: 'string',
							index: 'not_analyzed'
						},
						'investigativeTeamMembers': {
							type: 'string',
							index: 'not_analyzed'
						},
						'userBlacklist': {
							type: 'string',
							index: 'not_analyzed'
						},
						'systemBlacklist': {
							type: 'string',
							index: 'not_analyzed'
						},
						'restrictedCase': {
							type: 'boolean'
						},
						'isConfidential': {
							type: 'boolean'
						},
						'privilegedCase': {
							type: 'boolean'
						},
						'tatCase': {
							type: 'boolean'
						},
						'caseCountry': {
							type: 'string',
							index: 'not_analyzed'
						},
						'caseRegion': {
							type: 'string',
							index: 'not_analyzed'
						},
						'caseSubregion': {
							type: 'string',
							index: 'not_analyzed'
						}
					}
				},
				'parentId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'emailThreadId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'senderId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'senderName': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'senderEmail': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'createdBy': {
					type: 'string',
					index: 'not_analyzed'
				},
				'recipients': true,
				'subject': true,
				'body': true,
				'dateSent': true,
				'createdDate': true,
				'attachments': {
					type: 'object',
					properties: {
						name: { copy_to: 'fileNames', type: 'string' },
						content: { type: 'attachment' }
					}
				},
				'fileNames': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'latestSent': true
			}
		}, {
			base: 'sys',
			name: 'user',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'nick': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'name': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'email': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				},
				'firstName': true,
				'lastName': true,
				'phone': true,
				'fax': true,
				'roles': true,
				'perm': true,
				'active': {
					type: 'boolean',
					index: 'not_analyzed'
				}
			}
		}, {
			base: 'sys',
			name: 'trigger',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'target': true,
				'recipients': true,
				'escalation': true
			}
		}, {
			base: 'sys',
			name: 'document',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'kind': {
					type: 'string',
					index: 'not_analyzed'
				},
				'fileType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'description': true,
				'filename': true,
				'createdBy': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdDate': true
			}
		}, {
			base: 'sys',
			name: 'casesubstatus',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'name': true,
				'startDate': true,
				'endDate': true
			}

		}, {
			base: 'sys',
			name: 'case_link',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'caseId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'linkedCaseId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'number': true,
				'reason': true
			}
		}, {
			base: 'sys',
			name: 'listItem',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'name': {
					type: 'string',
					index: 'not_analyzed'
				},
				'value': {
					type: 'string',
					index: 'not_analyzed'
				},
				'parents': {
					type: 'string',
					index: 'not_analyzed'
				},
				'relatedData': true
			}
		}, {
			base: 'sys',
			name: 'translation',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'locale': {
					type: 'string',
					index: 'not_analyzed'
				},
				'key': {
					type: 'string',
					index: 'not_analyzed'
				},
				'value': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							index: 'not_analyzed'
						},
						analyzed: {
							type: 'string',
							index: 'analyzed'
						}
					}
				}
			}
		}, {
			base: 'sys',
			name: 'template',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'name': {
					type: 'string',
					index: 'not_analyzed'
				},
				'files': true,
				'caseType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'locale': {
					type: 'string',
					index: 'not_analyzed'
				},
				'fileType': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdDate': true,
				'createdBy': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdByName': {
					type: 'string',
					fields: {
						raw: {
							type: 'string',
							analyzer: 'case_insensitive_keyword'
						}
					}
				}
			}
		}, {
			base: 'sys',
			name: 'event',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'jobId': {
					type: 'string',
					index: 'not_analyzed'
				},
				'type': {
					type: 'string',
					index: 'not_analyzed'
				},
				'status': {
					type: 'string',
					index: 'not_analyzed'
				},
				'dateOccured': true,
				'details': true
			}
		}, {
			base: 'sys',
			name: 'response',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'name': {
					type: 'string',
					index: 'not_analyzed'
				},
				'body': {
					type: 'string',
					index: 'not_analyzed'
				},
				'type': {
					type: 'string',
					index: 'not_analyzed'
				},
				'locale': {
					type: 'string',
					index: 'not_analyzed'
				},
				'rank': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdBy': {
					type: 'string',
					index: 'not_analyzed'
				},
				'createdDate': true
			}
		},
		{
			base: 'sys',
			name: 'holiday_entry',
			indexedAttributes: {
				'id': {
					type: 'string',
					index: 'not_analyzed'
				},
				'name': {
					type: 'string',
					index: 'not_analyzed'
				},
				'dateFrom': true,
				'dateTo': true
			}
		}
	]
};