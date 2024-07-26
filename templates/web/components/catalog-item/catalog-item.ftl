<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign id = "i${contentModel.objectId?substring(0, 8)}" />
<style>
	#${id}.mouseover {
		background-image: url("${contentModel.classImage_s}");
	}
	.craftercms-ice-on #${id}.mouseover {
		background-image: none;
	}
</style>

<@crafter.div class="catalog-item wow fadeInUp" data\-wow\-delay="500ms">
	<div
		id="${id}"
		class="blog-thumb catalog-item-size"
		onmouseover="$(this).addClass('mouseover')"
		onmouseout="$(this).removeClass('mouseover')"
	>
		<#if modePreview>
			<@crafter.img class="xb-image" $field="classImage_s:" />
		</#if>
		<#assign classDays = "" />
    <#if contentModel.classDays_o?? && contentModel.classDays_o.item??>
      <#list contentModel.classDays_o.item as row>
        <#if classDays?has_content>
          <#assign classDays = classDays + " | " + row.day_s />
        <#else>
          <#assign classDays = classDays + row.day_s />
        </#if>
      </#list>
    </#if>
		<span class="blog-date">
			<@crafter.span $field="classCategory_s">
				${contentModel.classCategory_s!''}
			</@crafter.span>
			<#if contentModel.classDays_o?? && contentModel.classDays_o.item??>
				/
				<@crafter.span $field="classDays_o">
					${classDays}
				</@crafter.span>
			</#if>
			<#if contentModel.startTime_dt??>
				/
				<@crafter.span $field="startTime_dt">
					${contentModel.startTime_dt?time?string.short}
				</@crafter.span>
			</#if>
		</span>

		<@crafter.h3 $field="titleText_t" class="blog-title">
			${contentModel.titleText_t}
		</@crafter.h3>

		<h5 id="blog-author">
			by
			<@crafter.span $field="trainerName_t">
				${contentModel.trainerName_t}
			</@crafter.span>
		</h5>
	</div>
</@crafter.div>
