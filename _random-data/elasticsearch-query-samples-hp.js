//Read utf8 file awef, return contents in Buffer 'data' if successful
fs.readFile('awef', 'utf8', function(err, data) {
	if (err) {
		throw err;
	}
	console.log(data.toString());
});

{
	"query": {
		"filtered": {
			"query": {
				"match_all": {}
			},
			"filter": {
				"bool": {
					"must": [],
					"must_not": [
						[
							{ "term": { "caseStatus": "draft" } },
							{ "term": { "caseStatus": "canceled" } },
							{ "term": { "caseStatus": "draft" } }
						],
						{
							"term": {
								"isActiveRecord": false
							}
						},
						{
							"bool": {
								"should": [
									{
										"term": {
											"userBlacklist": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
										}
									},
									{
										"term": {
											"caseData.userBlacklist": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
										}
									}
								]
							}
						},
						{
							"bool": {
								"must": [
									{
										"bool": {
											"should": [
												{
													"term": { "caseStatus": "draft" }
												},
												{
													"term": { "caseData.caseStatus": "draft" }
												}
											]
										}
									},
									{
										"bool": {
											"must_not": [
												{
													"bool": {
														"should": [
															{ "term": { "owner": "b62d6d20-506e-47ea-b33c-b6febfb7fe24" } },
															{ "term": { "caseData.owner": "b62d6d20-506e-47ea-b33c-b6febfb7fe24" } }
														]
													}
												}
											]
										}
									}
								]
							}
						},
						{
							"bool": {
								"must": [
									{
										"bool": {
											"should": [
												{
													"bool": {
														"should": [
															{
																"term": {
																	"sensitive": true
																}
															},
															{
																"term": {
																	"caseData.sensitive": true
																}
															}
														]
													}
												},
												{
													"bool": {
														"should": [
															{
																"term": {
																	"attorneyClientPrivileged": true
																}
															},
															{
																"term": {
																	"caseData.attorneyClientPrivileged": true
																}
															}
														]
													}
												}
											]
										}
									},
									{
										"bool": {
											"must_not": [
												{
													"bool": {
														"should": [
															{
																"bool": {
																	"should": [
																		{
																			"term": {
																				"level1Manager": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
																			}
																		},
																		{
																			"term": {
																				"caseData.level1Manager": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
																			}
																		}
																	]
																}
															},
															{
																"bool": {
																	"should": [
																		{
																			"term": {
																				"level2Manager": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
																			}
																		},
																		{
																			"term": {
																				"caseData.level2Manager": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
																			}
																		}
																	]
																}
															},
															{
																"bool": {
																	"should": [
																		{
																			"term": {
																				"level3Manager": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
																			}
																		},
																		{
																			"term": {
																				"caseData.level3Manager": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
																			}
																		}
																	]
																}
															}
														]
													}
												},
												{
													"bool": {
														"should": [
															{
																"term": {
																	"investigativeTeamMembers": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
																}
															},
															{
																"term": {
																	"caseData.investigativeTeamMembers": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
																}
															}
														]
													}
												},
												{
													"bool": {
														"should": [
															{
																"term": {
																	"owner": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
																}
															},
															{
																"term": {
																	"caseData.owner": "b62d6d20-506e-47ea-b33c-b6febfb7fe24"
																}
															}
														]
													}
												}
											]
										}
									}
								]
							}
						}
					]
				}
			}
		}
	},
	"sort": [
		{
			"caseNumber.raw": {
				"order": "desc",
				"mode": "min",
				"ignore_unmapped": true
			}
		}
	],
	"size": 10,
	"from": 0
}