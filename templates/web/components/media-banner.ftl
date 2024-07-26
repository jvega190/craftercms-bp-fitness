<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="media-banner-component">
  <#if contentModel.displayMedia_s == "video">
    <video
      playsinline=""
      autoplay=""
      muted=""
      loop=""
      class="header-video__teaser-video"
      id="header-video__teaser-video"
    >
      <source src="${contentModel.videoBackground_s!''}" type="video/mp4">
    </video>
  <#else>
    <#assign imageSource = "" />
    <@crafter.forEach contentModel.bannerImages_o; row>
      <#if (imageSource?length > 0) >
        <#assign imageSource = imageSource + ',' + row.bannerImage_s />
      <#else>
        <#assign imageSource = row.bannerImage_s />
      </#if>
    </@crafter.forEach>
    <script id="mediaBannerImages" data-media-banner-images="${imageSource}"></script>
  </#if>
</@crafter.div>
