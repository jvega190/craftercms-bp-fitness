<#import "/templates/system/common/crafter.ftl" as crafter />

<#-- HEADER SECTION -->
<@crafter.div class="navbar navbar-default navbar-fixed-top sticky-navigation" role="navigation">
	<div class="container">

		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
			</button>
			<a href="/" class="navbar-brand">
				<@crafter.span $field="gymName_t:"/>
			</a>
		</div>
		<div class="collapse navbar-collapse">
			<@crafter.renderRepeatGroup
				$field="navigationMenuList_o"
				$containerTag="ul"
				$containerAttributes={ "class":"nav navbar-nav navbar-right" }
				$itemTag="li";
				row, index
			>
				<a href="${row.navigationMenu_s}">
					<@crafter.span $field="navigationMenuList_o.navigationMenuLabel_t" $index=index>
						${row.navigationMenuLabel_t}
					</@crafter.span>
				</a>
			</@crafter.renderRepeatGroup>
		</div>

	</div>
</@crafter.div>
