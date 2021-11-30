import 'imba/reset.css'
import { icons } from './icons'
global css button bgc:blue0 @hover:blue1 @active:blue2 rd:md px:5px shadow:0 0 0 1px blue4 c:blue9

tag app

	prop styles = ['outline', 'filled', 'negative']
	prop selectedStyle = 'outline'
	prop fillColor = "#d60000"
	prop strokeColor = "none"
	prop backgroundColor = "#d1d1d1"

	<self>

		css
			.controls d:flex g:20px p:20px
			.page d:flex g:10px flw:wrap jc:center ai:left p:10px
			.box size:50px bgc:{ backgroundColor } d:vflex ja:center p:1px
				.title h:12px fs:9px of:hidden text-overflow:ellipsis m:3px
			label d:flex g:10px ai:center p:10px bgc:cool1 fs:sm rd:md
			svg size:80%
			.fill svg >>> path fill:{fillColor}
			.stroke svg >>> path stroke:{strokeColor}
		
		<p[p:10px]> """
			This page lets you test some issues. These can cause trouble if the user of healthicons tries to change the icon color or use the icons on non-white backgrounds.

			"""

		<div.controls>
			for style in styles
				<label>
					<input type='radio' bind=selectedStyle value=style>
					<div> style
			
			<label>
				<input type="color" bind=fillColor>
				<div> "Fill Color ({fillColor})"
				<button @click=(fillColor = 'none')> "Reset"

			<label>
				<input type="color" bind=strokeColor>
				<div> "Stroke Color ({strokeColor})"
				<button @click=(strokeColor = 'none')> "Reset"

			<label>
				<input type="color" bind=backgroundColor>
				<div> "Background Color ({backgroundColor})"

		<div.page .stroke=(strokeColor != 'none') .fill=(fillColor != 'none')>
			for icon in icons
				<div.box>
					<svg src=icon[selectedStyle]>
					<div.title> icon.title

imba.mount <app>