<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="trainer-thumb">
	<@crafter.img
		$field="trainerImage_s"
		class="img-responsive trainer-image"
		src=(contentModel.trainerImage_s)
		alt="Trainer"
	/>
	<div class="trainer-overlay">
		<div class="trainer-des">
			<@crafter.h2 $field="trainerName_t:" />
			<@crafter.h3 $field="trainerTitle_t:" />
			<ul class="social-icon">
				<#if contentModel.socialMediaLinks_o?? && contentModel.socialMediaLinks_o.item??>
					<#list contentModel.socialMediaLinks_o.item as item>
						<li><a href="${item.url_s}" class="fa fa-${item.socialNetworkName_s} wow fadeInUp" data-wow-delay="500ms"></a></li>
					</#list>
				</#if>
			</ul>
		</div>
	</div>
</@crafter.div>
<@crafter.p $field="trainerDescription_t" class="trainer-description_t:"/>
