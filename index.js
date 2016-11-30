const bodyParser = require("body-parser")
const express = require("express")
const fs = require("fs")
const pug = require("pug")

let app = express()

app.use(bodyParser.urlencoded({
	extended: true
}))

var moduleConfigTypes = {
	text: {
		fields: [
			{
				type: "text",
				name: "content",
				label: "Content"
			}
		]
	}
}

function render(blocks, path, configMode) {
	let html = []

	for (let block of blocks) {
		let index = blocks.indexOf(block)

		if (block.module == "grid") {
			// TODO: OOP so the template calls .render()
			block.renders = render(block.blocks, path.concat(index))
		}

		// TODO: this is really bad: writing to shared memory
		block.path = path

		let htmlCode = pug.render(fs.readFileSync("modules/" + block.module + ".pug", "utf8"), block)

		if (configMode) {
			htmlCode = "<div data-cms-id=\"" + encodeURIComponent(path.concat(index).join(".")) + "\">" + htmlCode + "</div>"
		}

		if (block.container) {
			htmlCode = "<div class=\"container\">" + htmlCode + "</div>"
		}

		html.push(htmlCode)
	}

	return html
}

app.all("/", (req, res) => {
	let filePath = "pages/home.json"
	let config = JSON.parse(fs.readFileSync(filePath))
	let moduleToConfig = req.param("config")

	if (moduleToConfig != null && moduleToConfig.length > 0) {
		let path = moduleToConfig.split(/\./g)
		let obj = config

		for (let branch of path) {
			if (obj.blocks == null || !obj.blocks.hasOwnProperty(branch)) {
				throw new Error("Invalid path")
			}

			obj = obj.blocks[branch]
		}

		let configType = moduleConfigTypes[obj.module]

		if (configType == null) {
			res.send("This module cannot be configured from the web interface (yet).")
			return
		}

		if (req.method == "GET") {
			let output = pug.render(fs.readFileSync("modules/form.pug", "utf-8"), {
				form: configType.fields,
				submitText: "Save configuration",
				bare: true
			}, false)

			res.header("Content-Type", "text/html; charset=utf-8")
			res.send(output)
			return
		}

		if (req.method == "POST") {
			for (let field of configType.fields) {
				let newValue = req.body[field.name]

				if (newValue != null) {
					obj[field.name] = newValue
				}
			}

			fs.writeFileSync(filePath, JSON.stringify(config, null, "\t"))
			res.redirect("/") // TODO: just strip the config bit
			return
		}
	}

	let output = pug.render(fs.readFileSync("base.pug", "utf-8"), {
		blocks: render(config.blocks, [], moduleToConfig != null),
		configMode: moduleToConfig != null
	})

	res.header("Content-Type", "text/html; charset=utf-8")
	res.send(output)
})

app.listen(1337)
