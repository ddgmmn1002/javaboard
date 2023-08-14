tinymce.init({
	selector: "#post-tinyeditor",
	language: "ko_KR",
	height: 700,
	resize: false,
	menu: {
		file: { title: 'File', items: 'newdocument | preview | print ' },
    	edit: { title: 'Edit', items: 'undo redo | cut copy paste | selectall | searchreplace' },
		view: { title: 'View', items: 'visualaid visualblocks | preview fullscreen' },
		insert: { title: 'Insert', items: 'link codesample | charmap emoticons | hr pagebreak | insertdatetime' },
		format: { title: 'Format', items: 'bold italic underline strikethrough superscript subscript codeformat | align lineheight | forecolor backcolor | removeformat' },
		tools: { title: 'Tools', items: 'code wordcount' },
		table: { title: 'Table', items: 'inserttable | cell row column | tableprops deletetable' },
		help: { title: 'Help', items: 'help' }
	},
	plugins: [
		"advlist", "autolink", "lists", "link",
		"charmap", "preview", "codesample",
		"searchreplace", "visualblocks", "code", "fullscreen",
		"insertdatetime", "table", "help",
		"wordcount", "emoticons", "pagebreak"
	],
	toolbar:
		"undo redo | blocks typography fontsize | bold italic underline strikethrough | forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist | outdent indent | charmap emoticons | removeformat",
	content_style:
		"body { font-family:Helvetica,Arial,sans-serif; font-size:16px }",
});
