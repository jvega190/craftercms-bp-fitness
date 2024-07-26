<#import "/templates/system/common/crafter.ftl" as crafter />

<#macro printQuoteItem item>
	<#if item.component??>
		<#assign quoteItem = item.component />
	<#else>
		<#assign quoteItem =  siteItemService.getSiteItem(item.key) />
	</#if>
	<#if contentModel.quoteStyle_s == "quote">
		<i class="fa fa-quote-left"></i>
	</#if>
	<@crafter.h3 $model=quoteItem $field="description_t:"/>
	<h4>
		<@crafter.span $model=quoteItem $field="authorFullName_t:"/> (<@crafter.span $model=quoteItem $field="authorProfession_t:"/>)
	</h4>
</#macro>

<@crafter.section
	id="testimonial"
	class="quotes-section parallax-section prices-background"
	style=contentModel.imageBackground_s?has_content?then("background: url('${contentModel.imageBackground_s}') 50% 0 repeat-y fixed", "")
>
	<div class="container">
		<div class="row">

			<#if contentModel.displayTitleDescription_b>
				<div class="col-md-12 col-sm-12 text-center">
					<@crafter.h2 $field="titleText_t:" style="color:${contentModel.titleColor_s}"/>
					<@crafter.p $field="description_t:" style="margin-bottom: 20px" />
				</div>
			</#if>

			<#--
			The carousel does a lot of HTML structure manipulation and a lot of JavaScript handling which can
			make editing challenging for authors. In authoring, in edit mode, a flat list of the quotes is displayed.
			When edit mode is turned off, the carousel is created and initialised for faithful preview (see custom.js).
			In delivery, the carousel is always shown.
			-->
			<#if modePreview>
				<@crafter.renderRepeatGroup
					$field="quotes_o"
					$containerAttributes={
						"id": "owlTestimonialsTemplate",
						"class": "add-padding-if-empty wow fadeInUp col-sm-12",
						"data-wow-delay": "250ms"
					}
					$itemAttributes={
						"class": "item col-md-offset-2 col-md-8 col-sm-offset-1 col-sm-10",
						"style": "margin-bottom: 50px"
					};
					item, index
				>
					<@printQuoteItem item/>
				</@crafter.renderRepeatGroup>
				<div id="owl-testimonial" class="owl-carousel owl-theme col-sm-12"></div>
			<#else>
				<div id="owl-testimonial" class="owl-carousel owl-theme col-sm-12">
					<@crafter.forEach contentModel.quotes_o; item, index>
						<div
							data-wow-delay="500ms"
							class="item col-md-offset-2 col-md-8 col-sm-offset-1 col-sm-10 wow fadeInUp"
						>
							<@printQuoteItem item/>
						</div>
					</@crafter.forEach>
				</div>
			</#if>

		</div>
	</div>
</@crafter.section>
