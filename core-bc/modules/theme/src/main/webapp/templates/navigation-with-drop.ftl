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

										<#--
										-->	

										<ul class="child-menu" role="menu">
											<#list nav_item.getChildren() as nav_child>
												<#assign nav_child_attr_selected = "" />
												<#assign nav_child_css_class = "" />

												<#if nav_item.isSelected()>
													<#assign nav_child_attr_selected = "aria-selected='true'" />
													<#assign nav_child_css_class = "selected" />
												</#if>

												<li ${nav_child_attr_selected} class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
													<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">
														<span>
															${nav_child.getName()}
														</span>
													</a>
												</li>
											</#list>
										</ul>
										
										<#-- New columized menu. Not finished yet. Will replace above child menu. -->

										<#-- 
										<#assign navChildren = nav_item.getChildren() />
										<#assign navChildrenSize = navChildren?size />
										<#assign navChildrenColumns = 3 />
										<#assign navChildrenPerColumn = (navChildrenSize/navChildrenColumns)?ceiling />

										<div class="row-fluid">
											
											<div class="span4 first col1">
												<div>Col 1</div>
												<#list navChildren as nav_child>
													<#if nav_child_index gte 0 && nav_child_index lt (1*navChildrenPerColumn)>
														<#assign nav_child_attr_selected = "" />
														<#assign nav_child_css_class = "" />

														<#if nav_item.isSelected()>
															<#assign nav_child_attr_selected = "aria-selected='true'" />
															<#assign nav_child_css_class = "selected" />
														</#if>

														<div>
															<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">
																<span>
																	${nav_child.getName()}
																</span>
															</a>
														</div>
													</#if>
												</#list>
											</div>

											<div class="span4 col2">
												<div>Col 2</div>
												<#list navChildren as nav_child>
													<#if nav_child_index gte (1*navChildrenPerColumn) && nav_child_index lt (2*navChildrenPerColumn)>
														<#assign nav_child_attr_selected = "" />
														<#assign nav_child_css_class = "" />

														<#if nav_item.isSelected()>
															<#assign nav_child_attr_selected = "aria-selected='true'" />
															<#assign nav_child_css_class = "selected" />
														</#if>

														<div>
															<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">
																<span>
																	${nav_child.getName()}
																</span>
															</a>
														</div>
													</#if>
												</#list>
											</div>

											<div class="span4 last col3">
												<div>Col 3</div>
												<#list navChildren as nav_child>
													<#if nav_child_index gte (2*navChildrenPerColumn )>
														<#assign nav_child_attr_selected = "" />
														<#assign nav_child_css_class = "" />

														<#if nav_item.isSelected()>
															<#assign nav_child_attr_selected = "aria-selected='true'" />
															<#assign nav_child_css_class = "selected" />
														</#if>

														<div>
															<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">
																<span>
																	${nav_child.getName()}
																</span>
															</a>
														</div>
													</#if>
												</#list>												
											</div>

										</div>

										-->




									</#if>
							</div>
						</div>
					</div>
				</nav>

			</li>
		</#list>
	</ul>
</nav>
