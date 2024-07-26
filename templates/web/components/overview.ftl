<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.section id="${contentModel.sectionId}" class="parallax-section">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-sm-12">
        <@crafter.img $field="imageSection_s" class="img-responsive" src=(contentModel.imageSection_s) alt=(contentModel.titleText_t) />
        <#if contentModel.displayBlockQuote_b>
          <@crafter.blockquote $field="quoteDescription_html:" class="wow fadeInUp" $attributes={'data-wow-delay': '0.5'}/>
        </#if>
      </div>

      <div class="col-md-1"></div>

      <div class="wow fadeInUp col-md-4 col-sm-12" data-wow-delay="500ms">
        <div class="overview-detail">
          <@crafter.h2 $field="titleText_t:"/>

          <@crafter.div $field="description_t:"/>

          <#if contentModel.displayButton_b>
            <a href="${contentModel.buttonSectionLink_s}" class="btn btn-default smoothScroll">
              <@crafter.span $field="buttonText_t:"/>
            </a>
          </#if>
        </div>
      </div>

      <div class="col-md-1"></div>

    </div>
  </div>
</@crafter.section>
