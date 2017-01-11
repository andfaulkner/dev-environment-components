---------------------------------------------------------------------------------------------------
#MongoDB commands
---------------------------------------------------------------------------------------------------

DB cmds and general info
========================

Get help
--------
    help

View all dbs
------------
    show dbs

Select a db
-----------
    use name-of-db

---------------------------------------------------------------------------------------------------
Collections
===========

Show collections in currently selected db
-----------------------------------------
    show collections

Get collections help
--------------------
    db.collectionName.help()

View all items in current collection
------------------------------------
    db.collectionName.find()

Get number of records in current collection
-------------------------------------------
    db.collectionName.count()


Find matching collection
------------------------
    db.config.find({
        "_id" : ObjectId("58742b2f654111cfdbe9ca50"),
        "config" : {
            "masterPasswords" : [ ],
            "healthMapURL" : "http://healthmap.org/formobile/",
            "influenzaVaccineConceptIds" : [
                "5322bf33-1ff3-4f37-a818-bafd98bc641f",
                "564313ca-50e3-4d22-8398-06d189c42877",
                "0c701ef8-3691-4a75-9010-38d2d29a9696"
            ],
            "tetanusDiseaseConceptIds" : [ "b7705574-749d-4134-bb95-eceb3cd4be8c" ],
            "mainDiseaseConceptIds" : [
                "9c20a525-0a06-44a4-ac01-e2870aef15be",
                "c0aa6318-c54f-435e-a5a7-630a84e9aef5",
                "5ecf26d3-6052-4359-8863-15252cf3d817",
                "769b364e-d596-4f6d-9f57-b84ded7a89d9",
                "6316aa5f-8c3e-4beb-819a-3a34b74c645d"
            ],
            "minVersion" : {
                "android" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "Android", "fr" : "Android" }
                },
                "iOS" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "iOS", "fr" : "iOS" }
                }
            }
        },
        "oph" : {
            "enabled" : { "android" : true, "ios" : true },
            "helpURLs" : {
                "en" : "http://immunizeca.ca/en/ottawa",
                "fr" : "http://immunizeca.ca/fr/ottawa"
            },
            "consentTexts" : {
                "en" : "I am the parent or guardian of the child for whom I am sending personal health information to Ottawa Public Health and I understand that Ottawa Public Health collects personal health information to create an immunization record and facilitate communications with the parent/guardian and physician regarding the immunization requirements under the Day Nurseries Act (pursuant to section 33(1) of the Regulation 262 under the Day Nurseries Act) and the immunization program under the Immunization of School Pupils Act (pursuant to section 11).",
                "fr" : "Je suis le parent ou le tuteur de l’enfant dont j’envoie les données de santé personnelles à Santé publique Ottawa; je comprends que Santé publique Ottawa recueille des données de santé personnelles pour créer un dossier de vaccination et faciliter les communications avec le parent/tuteur et le médecin concernant les besoins d’immunisation en vertu de la Loi sur les garderies (paragraphe 33(1) du Règlement 262 de la Loi sur les garderies) et du programme d’immunisation prévu par la Loi sur l’immunisation des élèves (article 11)."
            },
            "tokenTTL" : 14400,
            "ottawaPrompt" : true,
            "cities" : [ ]
        }
    })


Find and store an item in a variable (like _.first)
---------------------------------------------------
    var item1 = db.config.findOne()


Insert item into collection
---------------------------
    db.config.insert({
        "_id" : ObjectId("58742b2f654111cfdbe9ca51"),
        "config" : {
            "masterPasswords" : [ "yay" ],
            "healthMapURL" : "http://healthmap.org/formobile/",
            "influenzaVaccineConceptIds" : [
                "5322bf33-1ff3-4f37-a818-bafd98bc641f",
                "564313ca-50e3-4d22-8398-06d189c42877",
                "0c701ef8-3691-4a75-9010-38d2d29a9696"
            ],
            "tetanusDiseaseConceptIds" : [ "b7705574-749d-4134-bb95-eceb3cd4be8c" ],
            "mainDiseaseConceptIds" : [
                "9c20a525-0a06-44a4-ac01-e2870aef15be",
                "c0aa6318-c54f-435e-a5a7-630a84e9aef5",
                "5ecf26d3-6052-4359-8863-15252cf3d817",
                "769b364e-d596-4f6d-9f57-b84ded7a89d9",
                "6316aa5f-8c3e-4beb-819a-3a34b74c645d"
            ],
            "minVersion" : {
                "android" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "Android", "fr" : "Android" }
                },
                "iOS" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "iOS", "fr" : "iOS" }
                }
            }
        },
        "oph" : {
            "enabled" : { "android" : true, "ios" : true },
            "helpURLs" : {
                "en" : "http://immunizeca.ca/en/ottawa",
                "fr" : "http://immunizeca.ca/fr/ottawa"
            },
            "consentTexts" : {
                "en" : "I am the parent or guardian of the child for whom I am sending personal health information to Ottawa Public Health and I understand that Ottawa Public Health collects personal health information to create an immunization record and facilitate communications with the parent/guardian and physician regarding the immunization requirements under the Day Nurseries Act (pursuant to section 33(1) of the Regulation 262 under the Day Nurseries Act) and the immunization program under the Immunization of School Pupils Act (pursuant to section 11).",
                "fr" : "Je suis le parent ou le tuteur de l’enfant dont j’envoie les données de santé personnelles à Santé publique Ottawa; je comprends que Santé publique Ottawa recueille des données de santé personnelles pour créer un dossier de vaccination et faciliter les communications avec le parent/tuteur et le médecin concernant les besoins d’immunisation en vertu de la Loi sur les garderies (paragraphe 33(1) du Règlement 262 de la Loi sur les garderies) et du programme d’immunisation prévu par la Loi sur l’immunisation des élèves (article 11)."
            },
            "tokenTTL" : 14400,
            "ottawaPrompt" : true,
            "cities" : [ ]
        }
    })

Update collection - modify a single item
------------------------------------------
    db.config.update({
        "_id" : ObjectId("58742b2f654111cfdbe9ca50"),
        "config" : {
            "masterPasswords" : [ ],
            "healthMapURL" : "http://healthmap.org/formobile/",
            "influenzaVaccineConceptIds" : [
                "5322bf33-1ff3-4f37-a818-bafd98bc641f",
                "564313ca-50e3-4d22-8398-06d189c42877",
                "0c701ef8-3691-4a75-9010-38d2d29a9696"
            ],
            "tetanusDiseaseConceptIds" : [ "b7705574-749d-4134-bb95-eceb3cd4be8c" ],
            "mainDiseaseConceptIds" : [
                "9c20a525-0a06-44a4-ac01-e2870aef15be",
                "c0aa6318-c54f-435e-a5a7-630a84e9aef5",
                "5ecf26d3-6052-4359-8863-15252cf3d817",
                "769b364e-d596-4f6d-9f57-b84ded7a89d9",
                "6316aa5f-8c3e-4beb-819a-3a34b74c645d"
            ],
            "minVersion" : {
                "android" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "Android", "fr" : "Android" }
                },
                "iOS" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "iOS", "fr" : "iOS" }
                }
            }
        },
        "oph" : {
            "enabled" : { "android" : true, "ios" : true },
            "helpURLs" : {
                "en" : "http://immunizeca.ca/en/ottawa",
                "fr" : "http://immunizeca.ca/fr/ottawa"
            },
            "consentTexts" : {
                "en" : "I am the parent or guardian of the child for whom I am sending personal health information to Ottawa Public Health and I understand that Ottawa Public Health collects personal health information to create an immunization record and facilitate communications with the parent/guardian and physician regarding the immunization requirements under the Day Nurseries Act (pursuant to section 33(1) of the Regulation 262 under the Day Nurseries Act) and the immunization program under the Immunization of School Pupils Act (pursuant to section 11).",
                "fr" : "Je suis le parent ou le tuteur de l’enfant dont j’envoie les données de santé personnelles à Santé publique Ottawa; je comprends que Santé publique Ottawa recueille des données de santé personnelles pour créer un dossier de vaccination et faciliter les communications avec le parent/tuteur et le médecin concernant les besoins d’immunisation en vertu de la Loi sur les garderies (paragraphe 33(1) du Règlement 262 de la Loi sur les garderies) et du programme d’immunisation prévu par la Loi sur l’immunisation des élèves (article 11)."
            },
            "tokenTTL" : 14400,
            "ottawaPrompt" : true,
            "cities" : [ ]
        }
    }, {
        "_id" : ObjectId("58742b2f654111cfdbe9ca50"),
        "config" : {
            "masterPasswords" : [ "grrrrrr" ],
            "healthMapURL" : "http://healthmap.org/formobile/",
            "influenzaVaccineConceptIds" : [
                "5322bf33-1ff3-4f37-a818-bafd98bc641f",
                "564313ca-50e3-4d22-8398-06d189c42877",
                "0c701ef8-3691-4a75-9010-38d2d29a9696"
            ],
            "tetanusDiseaseConceptIds" : [ "b7705574-749d-4134-bb95-eceb3cd4be8c" ],
            "mainDiseaseConceptIds" : [
                "9c20a525-0a06-44a4-ac01-e2870aef15be",
                "c0aa6318-c54f-435e-a5a7-630a84e9aef5",
                "5ecf26d3-6052-4359-8863-15252cf3d817",
                "769b364e-d596-4f6d-9f57-b84ded7a89d9",
                "6316aa5f-8c3e-4beb-819a-3a34b74c645d"
            ],
            "minVersion" : {
                "android" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "Android", "fr" : "Android" }
                },
                "iOS" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "iOS", "fr" : "iOS" }
                }
            }
        },
        "oph" : {
            "enabled" : { "android" : true, "ios" : true },
            "helpURLs" : {
                "en" : "http://immunizeca.ca/en/ottawa",
                "fr" : "http://immunizeca.ca/fr/ottawa"
            },
            "consentTexts" : {
                "en" : "I am the parent or guardian of the child for whom I am sending personal health information to Ottawa Public Health and I understand that Ottawa Public Health collects personal health information to create an immunization record and facilitate communications with the parent/guardian and physician regarding the immunization requirements under the Day Nurseries Act (pursuant to section 33(1) of the Regulation 262 under the Day Nurseries Act) and the immunization program under the Immunization of School Pupils Act (pursuant to section 11).",
                "fr" : "Je suis le parent ou le tuteur de l’enfant dont j’envoie les données de santé personnelles à Santé publique Ottawa; je comprends que Santé publique Ottawa recueille des données de santé personnelles pour créer un dossier de vaccination et faciliter les communications avec le parent/tuteur et le médecin concernant les besoins d’immunisation en vertu de la Loi sur les garderies (paragraphe 33(1) du Règlement 262 de la Loi sur les garderies) et du programme d’immunisation prévu par la Loi sur l’immunisation des élèves (article 11)."
            },
            "tokenTTL" : 14400,
            "ottawaPrompt" : true,
            "cities" : [ ]
        }
    })





















    db.config.update({
        "_id" : ObjectId("58742b2f654111cfdbe9ca51"),
        "config" : {
            "masterPasswords" : [ ],
            "healthMapURL" : "http://healthmap.org/formobile/",
            "influenzaVaccineConceptIds" : [
                "5322bf33-1ff3-4f37-a818-bafd98bc641f",
                "564313ca-50e3-4d22-8398-06d189c42877",
                "0c701ef8-3691-4a75-9010-38d2d29a9696"
            ],
            "tetanusDiseaseConceptIds" : [ "b7705574-749d-4134-bb95-eceb3cd4be8c" ],
            "mainDiseaseConceptIds" : [
                "9c20a525-0a06-44a4-ac01-e2870aef15be",
                "c0aa6318-c54f-435e-a5a7-630a84e9aef5",
                "5ecf26d3-6052-4359-8863-15252cf3d817",
                "769b364e-d596-4f6d-9f57-b84ded7a89d9",
                "6316aa5f-8c3e-4beb-819a-3a34b74c645d"
            ],
            "minVersion" : {
                "android" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "Android", "fr" : "Android" }
                },
                "iOS" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "iOS", "fr" : "iOS" }
                }
            }
        },
        "oph" : {
            "enabled" : { "android" : true, "ios" : true },
            "helpURLs" : {
                "en" : "http://immunizeca.ca/en/ottawa",
                "fr" : "http://immunizeca.ca/fr/ottawa"
            },
            "consentTexts" : {
                "en" : "I am the parent or guardian of the child for whom I am sending personal health information to Ottawa Public Health and I understand that Ottawa Public Health collects personal health information to create an immunization record and facilitate communications with the parent/guardian and physician regarding the immunization requirements under the Day Nurseries Act (pursuant to section 33(1) of the Regulation 262 under the Day Nurseries Act) and the immunization program under the Immunization of School Pupils Act (pursuant to section 11).",
                "fr" : "Je suis le parent ou le tuteur de l’enfant dont j’envoie les données de santé personnelles à Santé publique Ottawa; je comprends que Santé publique Ottawa recueille des données de santé personnelles pour créer un dossier de vaccination et faciliter les communications avec le parent/tuteur et le médecin concernant les besoins d’immunisation en vertu de la Loi sur les garderies (paragraphe 33(1) du Règlement 262 de la Loi sur les garderies) et du programme d’immunisation prévu par la Loi sur l’immunisation des élèves (article 11)."
            },
            "tokenTTL" : 14400,
            "ottawaPrompt" : true,
            "cities" : [ ]
        }
    }, {
        "_id" : ObjectId("58742b2f654111cfdbe9ca51"),
        "config" : {
            "masterPasswords" : [ "yayayaya" ],
            "healthMapURL" : "http://healthmap.org/formobile/",
            "influenzaVaccineConceptIds" : [
                "5322bf33-1ff3-4f37-a818-bafd98bc641f",
                "564313ca-50e3-4d22-8398-06d189c42877",
                "0c701ef8-3691-4a75-9010-38d2d29a9696"
            ],
            "tetanusDiseaseConceptIds" : [ "b7705574-749d-4134-bb95-eceb3cd4be8c" ],
            "mainDiseaseConceptIds" : [
                "9c20a525-0a06-44a4-ac01-e2870aef15be",
                "c0aa6318-c54f-435e-a5a7-630a84e9aef5",
                "5ecf26d3-6052-4359-8863-15252cf3d817",
                "769b364e-d596-4f6d-9f57-b84ded7a89d9",
                "6316aa5f-8c3e-4beb-819a-3a34b74c645d"
            ],
            "minVersion" : {
                "android" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "Android", "fr" : "Android" }
                },
                "iOS" : {
                    "version" : "0.0.0",
                    "messages" : { "en" : "iOS", "fr" : "iOS" }
                }
            }
        },
        "oph" : {
            "enabled" : { "android" : true, "ios" : true },
            "helpURLs" : {
                "en" : "http://immunizeca.ca/en/ottawa",
                "fr" : "http://immunizeca.ca/fr/ottawa"
            },
            "consentTexts" : {
                "en" : "I am the parent or guardian of the child for whom I am sending personal health information to Ottawa Public Health and I understand that Ottawa Public Health collects personal health information to create an immunization record and facilitate communications with the parent/guardian and physician regarding the immunization requirements under the Day Nurseries Act (pursuant to section 33(1) of the Regulation 262 under the Day Nurseries Act) and the immunization program under the Immunization of School Pupils Act (pursuant to section 11).",
                "fr" : "Je suis le parent ou le tuteur de l’enfant dont j’envoie les données de santé personnelles à Santé publique Ottawa; je comprends que Santé publique Ottawa recueille des données de santé personnelles pour créer un dossier de vaccination et faciliter les communications avec le parent/tuteur et le médecin concernant les besoins d’immunisation en vertu de la Loi sur les garderies (paragraphe 33(1) du Règlement 262 de la Loi sur les garderies) et du programme d’immunisation prévu par la Loi sur l’immunisation des élèves (article 11)."
            },
            "tokenTTL" : 14400,
            "ottawaPrompt" : true,
            "cities" : [ ]
        }
    })

---------------------------------------------------------------------------------------------------
