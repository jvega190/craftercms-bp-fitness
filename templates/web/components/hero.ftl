<#import "/templates/system/common/crafter.ftl" as crafter />

<#-- Hero -->
<@crafter.section id="home" class="parallax-section">
	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-1 col-md-10 col-sm-12 wow fadeInUp" data-wow-delay="500ms">
					<@crafter.h3 $field="h3FirstText_t:" />
					<@crafter.h1 $field="h1SecondText_t:" />
          <@crafter.h2 $field="h1ThirdText_t:" renderEmpty=false />
					<@crafter.a $field="buttonText_t:" renderEmpty=false href="${contentModel.buttonSectionLink_s}" class="smoothScroll btn btn-default" />
				</div>
			</div>
		</div>
		<@crafter.renderComponentCollection
			$field="mediaBanner_o"
			$containerAttributes={ "class": "header-video" }
			$itemAttributes={ "class": "media-banner-item" }
		/>
	</div>
</@crafter.section>
