
	 
	// Set OS flexibility
	clear all
	set more off
	if ("`c(os)'"=="Windows") {
		local j "{FILEPATH}"
		local h "{FILEPATH}"
	}
	else {
		local j "{FILEPATH}"
		local h "{FILEPATH}"
		set odbcmgr unixodbc
	}
	sysdir set PLUS "`h'/ado/plus"

	// parse incoming syntax elements
	cap program drop parse_syntax
	program define parse_syntax
		syntax, in_dir(string) cause_id(string) description(string) mark_best(string) sex_id(string)
		c_local in_dir = "`in_dir'"
		c_local cause_id = "`cause_id'"
		c_local mark_best = "`mark_best'"
		c_local description = "`description'"
		c_local sex_id = "`sex_id'"
	end
	parse_syntax, `0'

	// call
	di "`in_dir'"
	di "`cause_id'"
	di "`mark_best'"
	di "`description'"
	di "`sex_id'"
	run "{FILEPATH}/save_results.do"
	save_results, cause_id(`cause_id') description(`description') in_dir(`in_dir') mark_best(`mark_best') sexes(`sex_id')

