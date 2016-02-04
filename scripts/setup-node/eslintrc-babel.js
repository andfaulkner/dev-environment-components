// Sample .eslintrc file if you're using babel:

{
	"rules": {
		"indent": [2, "tab"],
		"quotes": [2, "single"],
		"linebreak-style": [2, "unix"],
		"semi": [2, "always"]
	},
  "parser": "babel-eslint",
	"env": {
		"es6": true,
		"node": true,
		"browser": true
	},
	"extends": "eslint:recommended",
	"ecmaFeatures": {
		"jsx": true,
		"experimentalObjectRestSpread": true,
		"generators": true,
		"arrowFunctions": true,
		"defaultParams": true,
		"spread": true,
		"restParams": true,
		"blockBindings": true,
		"templateStrings": true,
		"destructuring": true,
		"forOf": true,
		"regexUFlag": true,
		"regexYFlag": true,
		"objectLiteralComputedProperties": true,
		"objectLiteralShorthandProperties": true,
		"objectLiteralShorthandMethods": true,
		"objectLiteralDuplicateProperties": true,
		"classes": true
	},
	"plugins": [
		"react"
	]
}