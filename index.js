const express = require("express")
const fs = require("fs")
const knex = require("knex")
const pug = require("pug")

let db = knex({
	client: "mysql",
	connection: {
		host: "127.0.0.1",
		user: "minicms",
		password: "minicms",
		database: "minicms"
	}
})

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

function render(blocks) {
	let html = []

	for (let block of blocks) {
		if (block.module == "grid") {
			// TODO: OOP so the template calls .render()
			block.renders = render(block.blocks)
		}

		let htmlCode = pug.render(fs.readFileSync("modules/" + block.module + ".pug", "utf8"), block)

		if (block.container) {
			htmlCode = "<div class=\"container\">" + htmlCode + "</div>"
		}

		html.push(htmlCode)
	}

	return html
}

/*app.get("/", (req, res) => {
	res.header("Content-Type", "text/html; charset=utf-8")
	res.send(pug.render(fs.readFileSync("base.pug", "utf-8"), {
		blocks: render(config.blocks)
	}))
})*/

function handlePage(pageId, req, res) {
	//db("page").select("module_instance.*").where("page.pageId", pageId).leftJoin("module_instance", function() {
	db("page").select("module_instance.*").where("page.pageId", pageId).leftJoin("module_instance", function() {
		this.on("module_instance.pageId", "=", "page.pageId").orOn("module_instance.pageId", "=", "page.parentPageId")
	}).then((modules) => {
		res.send(modules)
	})
}

db("page_route").then((pageRoutes) => {
	for (let pageRoute of pageRoutes) {
		app.get(pageRoute.routePattern, (req, res) => handlePage(pageRoute.pageId, req, res))
	}
}).then(() => {
	app.listen(1337)
})
