import data from './icons/meta-data.json'

def getFullPath path\string, type\string do return "./icons/svg/{type}/{path}.svg"

def sanitize path
	path.replace("/", "_").replace("!", "exclamation")

const result = """ 

{
	data.map(do(d)
		["import filled_icon_{sanitize(d.path)} from '{getFullPath(d.path, 'filled')}'"
		"import negative_icon_{sanitize(d.path)} from '{getFullPath(d.path, 'negative')}'"
		"import outline_icon_{sanitize(d.path)} from '{getFullPath(d.path, 'outline')}'"].join("\n")
	).join("\n")
}

export const icons = \[
{
	data.map(do(d)
		"\t\{\n\t\ttitle: '{d.title}'\n\t\tfilled: filled_icon_{sanitize(d.path)}\n\t\tnegative: negative_icon_{sanitize(d.path)}\n\t\toutline: outline_icon_{sanitize(d.path)}\n\t}"	
	).join(",\n")
}
]\n

"""

const fs = require('fs')
fs.writeFile './app/icons.imba', result, do(err)
	if err
		console.log err
	else
		console.log 'wrote file'