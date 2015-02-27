<#--
<nav class="${nav_css_class}" id="navigation" role="navigation">
-->

<nav id="navigation" role="navigation" class="main-navigation">
	<ul aria-label="<@liferay.language key="site-pages" />" role="menubar">
		<#list nav_items as nav_item>
			<#assign nav_item_attr_has_popup = "" />
			<#assign nav_item_attr_selected = "" />
			<#assign nav_item_css_class = "" />

			<#if nav_item.isSelected()>
				<#assign nav_item_attr_has_popup = "aria-haspopup='true'" />
				<#assign nav_item_attr_selected = "aria-selected='true'" />
				<#assign nav_item_css_class = "selected" />
			</#if>

			<#if nav_item.hasChildren()>
				<#assign nav_item_css_class = nav_item_css_class + " dropdown" />
			</#if>

			<li ${nav_item_attr_selected} class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
				<a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span>${nav_item.icon()} ${nav_item.getName()}</span></a>

				<nav role="submenu" class="sub-menu">
					<div class="mega-drop">
						<div class="container-normal">
							<div class="inner">
									<#if nav_item.hasChildren()>
											<ul>
													<#list nav_item.getChildren() as nav_child>
														<li>
																<#assign child_item_url = nav_child.getURL() />
																<#assign child_item_name = nav_child.getName() />
																<a href="${child_item_url}">${child_item_name}</a>
														</li>
													</#list>
											</ul>
									</#if>
							</div>
						</div>
					</div>
				</nav>


				<#--
				<#if nav_item.hasChildren()>
					<ul class="child-menu" role="menu">
						<#list nav_item.getChildren() as nav_child>
							<#assign nav_child_attr_selected = "" />
							<#assign nav_child_css_class = "" />

							<#if nav_item.isSelected()>
								<#assign nav_child_attr_selected = "aria-selected='true'" />
								<#assign nav_child_css_class = "selected" />
							</#if>

							<li ${nav_child_attr_selected} class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
								<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
							</li>
						</#list>
					</ul>
				</#if>
				-->

			</li>
		</#list>
	</ul>
</nav>
