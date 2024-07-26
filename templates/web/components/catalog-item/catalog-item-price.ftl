<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="wow fadeInUp" $attributes={'data-wow-delay': '0.5' }>
	<div class="pricing__item">
		<@crafter.h3 $field="titleText_t:" class="pricing__title"/>
		<div class="pricing__price">
			<span class="pricing__currency">$</span>
			<@crafter.span $field="price_t:"/>
		</div>

		<@crafter.renderRepeatGroup
			$field="services_o"
			$containerAttributes={'class': 'pricing__feature-list'}
			$itemAttributes={'class': 'pricing__feature'};
			<#-- Nested content values passed down by the macro: -->
			item, index
		>
			<#assign myContentItem = siteItemService.getSiteItem(item.key) />
			<@crafter.span $model=myContentItem $field="titleText_t:"/>
		</@crafter.renderRepeatGroup>

		<#if contentModel.displayButton_b>
			<button
				class="pricing__action"
				<#-- Check if edit mode is on and avoid the location change so editing the button text works smoother. -->
				onclick="$('.craftercms-ice-on').length === 0 && (location.href = '${contentModel.buttonUrl_s}');"
			>
				<@crafter.span $field="buttonText_t">
					${contentModel.buttonText_t}
				</@crafter.span>
			</button>
		</#if>

	</div>
</@crafter.div>
