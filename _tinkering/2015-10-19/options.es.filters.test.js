//TODO CONFIG THIS - CURRENTLY ONLY DEFAULTS PRESENT
/* global module */
// NOTE: filter: function(ctx), context is passed through first parameter
module.exports = {
    // -- ownership roles --
    // FROM ANOTHER CONFIG: case_owner, gi_lead_investigator, gig_lead,
    // investigative_team_member, lead_investigator, rs_lead_investigator, workstream_lead

    // -- ownership exclusion roles --
    // FROM ANOTHER CONFIG: Ethics, Responsible Sourcing, GI Corporate & Retail
    // ** all workstreams **
    // FROM ANOTHER CONFIG: restricted_if_assigned, tier1_if_assigned
		/*************************************************
		*       RESTRICTED CASES
		*/

    filters: [
    {
			name: 'can never access restricted cases',
			roles: [],
			missing_roles: [
				'restricted',
				'restricted_if_assigned'
			],
			entityTypes: [
				'sys_case'
			],
			filters: function() {+
				return {
					bool: {
						must_not: [{
							term: {
								restricted: true
							}
						}]
					}
				};
			}
		},
		{
			name: 'can access restricted cases if assigned',
			roles: ['restricted_if_assigned'],
			missing_roles: ['restricted'],
			entityTypes: [
				'sys_case'
			],
			filters: function(ctx) {
				return {
					bool: {
						should: [{
							bool: {
								must: [{
									term: {
										restricted: true
									}
								}],
								should: [{
									term: {
										owner: ctx.user.id
									}
								}, {
									term: {
										leadInvestigator: ctx.user.id
									}
								}, {
									term: {
										rsLeadInvestigator: ctx.user.id
									}
								}, {
									term: {
										giLeadInvestigator: ctx.user.id
									}
								}, {
									term: {
										investigativeTeamMembers: ctx.user.id
									}
								}, {
									term: {
										gigLead: ctx.user.id
									}
								}, {
									term: {
										workstreamLead: ctx.user.id
									}
								}]
							}
						}]
					}
				};
			}
		},
		{
			name: 'can access restricted cases',
			roles: ['view_all_cases', 'restricted'],
			missing_roles: [],
			entityTypes: [
				'sys_case'
			],
			filters: function() {
				return {
					bool: {
						should: [{
							term: {
								restricted: true
							}
						}]
					}
				};
			}
		},
		/************************************************/

		/*************************************************
		*       CONFIDENTIAL CASES
		*/
    {
			name: 'can never access confidential cases',
			roles: [],
			missing_roles: [
				'read_and_edit_confidential_cases',
				'can_access_confidential_cases',
				'confidential_if_assigned'
			],
			entityTypes: [
				'sys_case'
			],
			filters: function() {+
				return {
					bool: {
						must_not: [{
							term: {
								isConfidential: true
							}
						}]
					}
				};
			}
		},

		{
			name: 'can access confidential cases if assigned',
			roles: ['confidential_if_assigned'],
			missing_roles: [
				'read_and_edit_confidential_cases',
				'can_access_confidential_cases'
			],
			entityTypes: [
				'sys_case'
			],
			filters: function(ctx) {
				return {
					bool: {
						should: [{
							bool: {
								must: [{
									term: {
										isConfidential: true
									}
								}],
								should: [{
									term: {
										owner: ctx.user.id
									}
								}, {
									term: {
										leadInvestigator: ctx.user.id
									}
								}, {
									term: {
										rsLeadInvestigator: ctx.user.id
									}
								}, {
									term: {
										giLeadInvestigator: ctx.user.id
									}
								}, {
									term: {
										investigativeTeamMembers: ctx.user.id
									}
								}, {
									term: {
										gigLead: ctx.user.id
									}
								}, {
									term: {
										workstreamLead: ctx.user.id
									}
								}]
							}
						}]
					}
				};
			}
		},

		{
			name: 'can access confidential cases',
			roles: [
				'view_all_cases',
				'read_and_edit_confidential_cases',
				'can_access_confidential_cases'],
			missing_roles: [],
			entityTypes: [
				'sys_case'
			],
			filters: function() {
				return {
					bool: {
						should: [{
							term: {
								isConfidential: true
							}
						}]
					}
				};
			}
		},
		/************************************************/

		{
			name: 'can access privileged cases if assigned',
			roles: [],
			missing_roles: ['privileged'],
			entityTypes: [
				'sys_case'
			],
			filters: function(ctx) {
				return {
					bool: {
						should: [{
							bool: {
								must: [{
									term: {
										privileged: true
									}
								}],
								should: [{
									term: {
										owner: ctx.user.id
									}
								}, {
									term: {
										leadInvestigator: ctx.user.id
									}
								}, {
									term: {
										rsLeadInvestigator: ctx.user.id
									}
								}, {
									term: {
										giLeadInvestigator: ctx.user.id
									}
								}, {
									term: {
										investigativeTeamMembers: ctx.user.id
									}
								}, {
									term: {
										gigLead: ctx.user.id
									}
								}, {
									term: {
										workstreamLead: ctx.user.id
									}
								}]
							}
						}]
					}
				};
			}
		}, {
			name: 'can access cases with no access control restriction',
			roles: ['view_all_cases'],
			missing_roles: [],
			entityTypes: [
				'sys_case'
			],
			filters: function() {
				return {
					bool: {
						should: [{
							bool: {
								must_not: [{
									term: {
										privileged: true
									}
								}, {
									term: {
										restricted: true
									}
								}, {
									term: {
										caseTier: 'Tier 1'
									}
								}]
							}
						}]
					}
				};
			}
		}, {
			name: 'can access assigned cases with no access control restriction',
			roles: [],
			missing_roles: ['view_all_cases'],
			entityTypes: [
				'sys_case'
			],
			filters: function(ctx) {
				return {
					bool: {
						should: [{
							bool: {
								must_not: [{
									term: {
										privileged: true
									}
								}, {
									term: {
										restricted: true
									}
								}, {
									term: {
										caseTier: 'Tier 1'
									}
								}],
								should: [{
									term: {
										owner: ctx.user.id
									}
								}, {
									term: {
										leadInvestigator: ctx.user.id
									}
								}, {
									term: {
										rsLeadInvestigator: ctx.user.id
									}
								}, {
									term: {
										giLeadInvestigator: ctx.user.id
									}
								}, {
									term: {
										investigativeTeamMembers: ctx.user.id
									}
								}, {
									term: {
										gigLead: ctx.user.id
									}
								}, {
									term: {
										workstreamLead: ctx.user.id
									}
								}]
							}
						}]
					}
				};
			}
		}
	]
};


// EXAMPLE BELOW: DIRECTLY COPIED FROM CONFIG_HPS_V5 PROJECT:::

/* global module */
//
// module.exports = {
// 	// -- ownership roles --
// 	// case_owner, gi_lead_investigator, gig_lead, investigative_team_member, lead_investigator,
// 	// rs_lead_investigator, workstream_lead

// 	// -- ownership exclusion roles --
// 	// Ethics, Responsible Sourcing, GI Corporate & Retail
// 	// ** all workstreams **
// 	// restricted_if_assigned, tier1_if_assigned
// 	filters: [{
// 			name: 'User not ethics nor assignee',
// 			roles: [],
// 			missing_roles: [
// 				'Ethics',
// 				'case_owner',
// 				'gi_lead_investigator',
// 				'gig_lead',
// 				'lead_investigator',
// 				'rs_lead_investigator',
// 				'workstream_lead',
// 				'investigative_team_member'
// 			],
// 			entityTypes: [
// 				'sys_case',
// 				'sys_todo',
// 				'sys_note',
// 				'sys_party',
// 				'sys_attachment',
// 				'sys_interviewdetail',
// 				'sys_vehicledetail',
// 				'sys_evidencedetail'
// 			],
// 			filters: {
// 				bool: {
// 					must_not: [{
// 						term: {
// 							caseType: 'Ethics'
// 						}
// 					}]
// 				}
// 			}
// 		},

// 		{
// 			name: 'User not Responsible Sourcing nor assignee',
// 			roles: [],
// 			missing_roles: [
// 				'Responsible Sourcing',
// 				'case_owner',
// 				'gi_lead_investigator',
// 				'gig_lead',
// 				'lead_investigator',
// 				'rs_lead_investigator',
// 				'workstream_lead',
// 				'investigative_team_member'
// 			],
// 			entityTypes: [
// 				'sys_case',
// 				'sys_todo',
// 				'sys_note',
// 				'sys_party',
// 				'sys_attachment',
// 				'sys_interviewdetail',
// 				'sys_vehicledetail',
// 				'sys_evidencedetail'
// 			],
// 			filters: {
// 				bool: {
// 					must_not: [{
// 						term: {
// 							caseType: 'Responsible Sourcing'
// 						}
// 					}]
// 				}
// 			}
// 		}, {
// 			name: 'User not GI Corporate & Retail nor assignee',
// 			roles: [],
// 			missing_roles: [
// 				'GI Corporate & Retail',
// 				'case_owner',
// 				'gi_lead_investigator',
// 				'gig_lead',
// 				'lead_investigator',
// 				'rs_lead_investigator',
// 				'workstream_lead',
// 				'investigative_team_member'
// 			],
// 			entityTypes: [
// 				'sys_case',
// 				'sys_todo',
// 				'sys_note',
// 				'sys_party',
// 				'sys_attachment',
// 				'sys_interviewdetail',
// 				'sys_vehicledetail',
// 				'sys_evidencedetail'
// 			],
// 			filters: {
// 				bool: {
// 					must_not: [{
// 						term: {
// 							caseType: 'GI Corporate & Retail'
// 						}
// 					}]
// 				}
// 			}
// 		},

// 		{
// 			name: 'can never access restricted cases',
// 			roles: [],
// 			missing_roles: [
// 				'restricted',
// 				'restricted_if_assigned'
// 			],
// 			entityTypes: [
// 				'sys_case'
// 			],
// 			filters: function() {
// 				return {
// 					bool: {
// 						must_not: [{
// 							term: {
// 								restricted: true
// 							}
// 						}]
// 					}
// 				};
// 			}
// 		},

// 		{
// 			name: 'can never access Tier 1 cases',
// 			roles: ['view_all_cases'],
// 			missing_roles: [
// 				'tier1',
// 				'tier1_if_assigned'
// 			],
// 			entityTypes: [
// 				'sys_case'
// 			],
// 			filters: function() {
// 				return {
// 					bool: {
// 						must_not: [{
// 							term: {
// 								caseTier: 'Tier 1'
// 							}
// 						}]
// 					}
// 				};
// 			}
// 		}, {
// 			name: 'can access restricted cases',
// 			roles: ['view_all_cases', 'restricted'],
// 			missing_roles: [],
// 			entityTypes: [
// 				'sys_case'
// 			],
// 			filters: function() {
// 				return {
// 					bool: {
// 						should: [{
// 							term: {
// 								restricted: true
// 							}
// 						}]
// 					}
// 				};
// 			}
// 		}, {
// 			name: 'can access restricted cases if assigned',
// 			roles: ['restricted_if_assigned'],
// 			missing_roles: ['restricted'],
// 			entityTypes: [
// 				'sys_case'
// 			],
// 			filters: function(ctx) {
// 				return {
// 					bool: {
// 						should: [{
// 							bool: {
// 								must: [{
// 									term: {
// 										restricted: true
// 									}
// 								}],
// 								should: [{
// 									term: {
// 										owner: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										leadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										rsLeadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										giLeadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										investigativeTeamMembers: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										gigLead: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										workstreamLead: ctx.user.id
// 									}
// 								}]
// 							}
// 						}]
// 					}
// 				};
// 			}
// 		}, {
// 			name: 'can access Tier 1 cases',
// 			roles: ['view_all_cases', 'tier1'],
// 			missing_roles: [],
// 			entityTypes: [
// 				'sys_case'
// 			],
// 			filters: function() {
// 				return {
// 					bool: {
// 						should: [{
// 							term: {
// 								caseTier: 'Tier 1'
// 							}
// 						}]
// 					}
// 				};
// 			}
// 		}, {
// 			name: 'can access Tier 1 cases if assigned',
// 			roles: ['tier1_if_assigned'],
// 			missing_roles: ['tier1'],
// 			entityTypes: [
// 				'sys_case'
// 			],
// 			filters: function(ctx) {
// 				return {
// 					bool: {
// 						should: [{
// 							bool: {
// 								must: [{
// 									term: {
// 										caseTier: 'Tier 1'
// 									}
// 								}],
// 								should: [{
// 									term: {
// 										owner: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										leadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										rsLeadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										giLeadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										investigativeTeamMembers: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										gigLead: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										workstreamLead: ctx.user.id
// 									}
// 								}]
// 							}
// 						}]
// 					}
// 				};
// 			}
// 		}, {
// 			name: 'can access privileged cases if assigned',
// 			roles: [],
// 			missing_roles: ['privileged'],
// 			entityTypes: [
// 				'sys_case'
// 			],
// 			filters: function(ctx) {
// 				return {
// 					bool: {
// 						should: [{
// 							bool: {
// 								must: [{
// 									term: {
// 										privileged: true
// 									}
// 								}],
// 								should: [{
// 									term: {
// 										owner: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										leadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										rsLeadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										giLeadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										investigativeTeamMembers: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										gigLead: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										workstreamLead: ctx.user.id
// 									}
// 								}]
// 							}
// 						}]
// 					}
// 				};
// 			}
// 		}, {
// 			name: 'can access privileged cases',
// 			roles: ['view_all_cases', 'privileged'],
// 			missing_roles: [],
// 			entityTypes: [
// 				'sys_case'
// 			],
// 			filters: function() {
// 				return {
// 					bool: {
// 						should: [{
// 							term: {
// 								privileged: true
// 							}
// 						}]
// 					}
// 				};
// 			}
// 		}, {
// 			name: 'can access cases with no access control restriction',
// 			roles: ['view_all_cases'],
// 			missing_roles: [],
// 			entityTypes: [
// 				'sys_case'
// 			],
// 			filters: function() {
// 				return {
// 					bool: {
// 						should: [{
// 							bool: {
// 								must_not: [{
// 									term: {
// 										privileged: true
// 									}
// 								}, {
// 									term: {
// 										restricted: true
// 									}
// 								}, {
// 									term: {
// 										caseTier: 'Tier 1'
// 									}
// 								}]
// 							}
// 						}]
// 					}
// 				};
// 			}
// 		}, {
// 			name: 'can access assigned cases with no access control restriction',
// 			roles: [],
// 			missing_roles: ['view_all_cases'],
// 			entityTypes: [
// 				'sys_case'
// 			],
// 			filters: function(ctx) {
// 				return {
// 					bool: {
// 						should: [{
// 							bool: {
// 								must_not: [{
// 									term: {
// 										privileged: true
// 									}
// 								}, {
// 									term: {
// 										restricted: true
// 									}
// 								}, {
// 									term: {
// 										caseTier: 'Tier 1'
// 									}
// 								}],
// 								should: [{
// 									term: {
// 										owner: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										leadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										rsLeadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										giLeadInvestigator: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										investigativeTeamMembers: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										gigLead: ctx.user.id
// 									}
// 								}, {
// 									term: {
// 										workstreamLead: ctx.user.id
// 									}
// 								}]
// 							}
// 						}]
// 					}
// 				};
// 			}
// 		}
// 	]
// };