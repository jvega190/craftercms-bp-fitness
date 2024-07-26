<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign hasBg = (contentModel.imageBackground_s?? && contentModel.imageBackground_s != "") />

<@crafter.section
	id=hasBg?then("price", "class")
	class="catalog-section parallax-section ${hasBg?then('prices-background', '')}"
	style=hasBg?then("background: url('${contentModel.imageBackground_s}') 50% 0 repeat-y fixed", "")
>
	<div class="container">
		<div class="row">

			<div class="col-md-12 col-sm-12 text-center">
				<@crafter.h2 $field="titleText_t:" style="color: ${contentModel.titleColor_s}" />
				<@crafter.p $field="description_t:" />
			</div>

			<#assign nthItemAttributes = {} />
			<@crafter.forEach contentModel.items_o; class, index>
				<#if class.component??>
					<#assign classItem = class.component />
				<#else>
					<#assign classItem =  siteItemService.getSiteItem(class.key) />
				</#if>
				<#assign field = "content-type" />
				<#if classItem[field] == "/component/catalog-item-price">
					<#assign nthItemAttributes += { "${index}": { "class": "col-md-4 col-sm-6" } } />
				<#else>
					<#assign nthItemAttributes += { "${index}": { "class": "col-md-6 col-sm-12" } } />
				</#if>
			</@crafter.forEach>
			<@crafter.renderComponentCollection
				$field="items_o"
				$containerAttributes={ "class": "col-md-12 col-sm-12 add-padding-if-empty" }
				$nthItemAttributes=nthItemAttributes
			/>

		</div>
	</div>
</@crafter.section>
