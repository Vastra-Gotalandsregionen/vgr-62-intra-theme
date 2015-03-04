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
										<#assign nav_childs = nav_item.getChildren() />
										<#assign chunk_size = (nav_childs?size / 4)?ceiling />

										<#assign nav_child_chunks = nav_childs?chunk(chunk_size) />

										<#assign numberOfChilds = nav_childs?size />
										<#assign numberOfColumns = 4 />
										<#assign ratioChildsColumns = numberOfChilds / numberOfColumns />
										<#assign minItemsPerColumn = ratioChildsColumns?floor />
										<#assign maxItemsPerColumn = ratioChildsColumns?ceiling />
										<#assign childColumnModulus = numberOfChilds % numberOfColumns />
										<#assign numberOfColumnsWithMax = numberOfColumns * (ratioChildsColumns - childColumnModulus) />

										<#--
										<p>numberOfChilds: ${numberOfChilds}</p>
										<p>numberOfColumns: ${numberOfColumns}</p>
										<p>numberOfColumnsWithMax: ${numberOfColumnsWithMax}</p>

										<p>ratioChildsColumns: ${ratioChildsColumns}</p>
										<p>minItemsPerColumn: ${minItemsPerColumn}</p>
										<p>maxItemsPerColumn: ${maxItemsPerColumn}</p>
										<p>childColumnModulus: ${childColumnModulus}</p>

										-->
										<#--
										<#assign lastStop = 0 />

										<#list 1..numberOfColumns as i>
											<#assign itemsPerColumn = minItemsPerColumn />

											<#if i lte numberOfColumnsWithMax>
												<#assign itemsPerColumn = maxItemsPerColumn />
											</#if>

											<#assign indexStart = lastStop />
											<#assign indexStop = i * itemsPerColumn -1 />

											<p>i=${i}, loopa ${indexStart} tom ${indexStop}</p>

											<#assign lastStop = indexStop />

										</#list>
										-->

										<#--

										<div class="row-fluid submenu-row">

											<div class="span3">
												<div class="submenu-col-inner">
													<#list nav_item.getChildren() as nav_child>
														<#if nav_child_index % 4 == 0>
															<div>
																<#assign child_item_url = nav_child.getURL() />
																<#assign child_item_name = nav_child.getName() />
																<a href="${child_item_url}">${child_item_name}</a>
															</div>
														</#if>
													</#list>
												</div>
											</div>
											<div class="span3">
												<div class="submenu-col-inner">
													<#list nav_item.getChildren() as nav_child>
														<#if (nav_child_index-1) % 4 == 0>
															<div>
																<#assign child_item_url = nav_child.getURL() />
																<#assign child_item_name = nav_child.getName() />
																<a href="${child_item_url}">${child_item_name}</a>
															</div>
														</#if>
													</#list>
												</div>
											</div>
											<div class="span3">
												<div class="submenu-col-inner">
													<#list nav_item.getChildren() as nav_child>
														<#if (nav_child_index-2) % 4 == 0>
															<div>
																<#assign child_item_url = nav_child.getURL() />
																<#assign child_item_name = nav_child.getName() />
																<a href="${child_item_url}">${child_item_name}</a>
															</div>
														</#if>
													</#list>
												</div>
											</div>

											<div class="span3">
												<div class="submenu-col-inner">
													<#list nav_item.getChildren() as nav_child>
														<#if (nav_child_index-3) % 4 == 0>
															<div>
																<#assign child_item_url = nav_child.getURL() />
																<#assign child_item_name = nav_child.getName() />
																<a href="${child_item_url}">${child_item_name}</a>
															</div>
														</#if>
													</#list>
												</div>
											</div>

										</div>
										-->

										<#--


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
