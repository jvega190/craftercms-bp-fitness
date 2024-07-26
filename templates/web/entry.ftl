<#-- Fitness Template • http://www.templatemo.com/tm-487-fitness -->
<#import "/templates/system/common/crafter.ftl" as crafter />

<!DOCTYPE html>
<html lang="en" data-craftercms-preview="${modePreview?c}">
<head>
  <title>${model.title_t!""}</title>
  <meta name="description" content="">
  <meta name="author" content="">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

  <link rel="stylesheet" href="/static-assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="/static-assets/css/animate.css">
  <link rel="stylesheet" href="/static-assets/css/font-awesome.min.css">
  <link rel="stylesheet" href="/static-assets/css/owl.theme.default.css">
  <link rel="stylesheet" href="/static-assets/css/owl.carousel.css">

  <!-- Main css -->
  <link rel="stylesheet" href="/static-assets/css/style.css">

  <!-- Google Font -->
  <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Lora:700italic' rel='stylesheet' type='text/css'>
  <@crafter.head/>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<@crafter.body_top/>

<!-- PRE LOADER -->
<div  class="preloader">
  <div class="sk-spinner sk-spinner-pulse"></div>
</div>

<!-- HEADER SECTION -->
<@crafter.renderComponentCollection $field="header_o" />

<!-- PAGE SECTIONS -->
<@crafter.renderComponentCollection $field="pageSections_o" />

<!-- FOOTER SECTION -->
<@crafter.renderComponentCollection $field="footer_o" />

<div
  id="modal-transparent"
  class="modal fade"
  tabindex="-1"
  role="dialog"
  aria-labelledby="myModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Newsletter Subscription</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Thanks for subscribing to our newsletter.
      </div>
    </div>
  </div>
</div>

<#-- SCRIPTS -->
<script src="/static-assets/js/jquery.js"></script>
<script src="/static-assets/js/bootstrap<#if !modePreview>.min</#if>.js"></script>
<script src="/static-assets/js/jquery.parallax.js"></script>
<script src="/static-assets/js/jquery.nav.js"></script>
<script src="/static-assets/js/jquery.backstretch.min.js"></script>
<script src="/static-assets/js/owl.carousel<#if !modePreview>.min</#if>.js"></script>
<script src="/static-assets/js/smoothscroll.js"></script>
<script src="/static-assets/js/wow.min.js"></script>
<script src="/static-assets/js/custom.js"></script>

<@crafter.body_bottom/>
</body>
</html>
