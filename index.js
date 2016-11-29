const express = require("express")
const fs = require("fs")
const pug = require("pug")

let app = express()

let config = {
	blocks: [
		{
			module: "nav",
			siteName: "Blocks",
			nav: ["Home", "Contact"],
			right: ["Test"]
		},
		{
			module: "text",
			container: true,
			content: "Hello and welcome to the experiment!"
		},
		{
			module: "html",
			container: true,
			content: "<hr>"
		},
		{
			module: "grid",
			blocks: [
				{
					module: "text",
					size: 0.5,
					content: "Look at that nice form! »"
				},
				{
					module: "form",
					size: 0.5,
					form: [
						{
							type: "message",
							severity: "warning",
							text: "Do not enter fake details!"
						},
						{
							type: "text",
							name: "name",
							label: "Full Name"
						},
						{
							type: "text",
							name: "email",
							label: "E-mail address"
						},
						{
							type: "textarea",
							name: "message",
							label: "Message"
						},
						{
							type: "checkbox",
							name: "subscribe",
							label: "Subscribe to our newsletter?"
						}
					],
					submitText: "Send"
				}
			]
		},
		{
			module: "footer",
			copyright: "Copyright © Test Company 2016"
		}
	]
}

function render(blocks, path) {
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
		htmlCode = "<div data-cms-id=\"" + encodeURIComponent(path.concat(index).join(".")) + "\">" + htmlCode + "</div>"

		if (block.container) {
			htmlCode = "<div class=\"container\">" + htmlCode + "</div>"
		}

		html.push(htmlCode)
	}

	return html
}

app.get("/", (req, res) => {
	res.header("Content-Type", "text/html; charset=utf-8")
	res.send(pug.render(fs.readFileSync("base.pug", "utf-8"), {
		blocks: render(config.blocks, [])
	}))
})

app.listen(1337)
