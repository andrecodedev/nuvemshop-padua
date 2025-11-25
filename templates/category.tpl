{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}
{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_footer %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% paginate by 12 %}

	{% if not show_help %}

		{% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
		{% if category_banner %}
			{% include 'snipplets/category-banner.tpl' %}
		{% endif %}


		{% set category_grid_banner01 = ("category-image-first.jpg" | has_custom_image)  %}
		{% set category_grid_banner02 = ("category-image-last.jpg" | has_custom_image)  %}

		{% set category_image_first = 'category-image-first.jpg' %}
		{% set category_image_last = 'category-image-last.jpg' %}


		<section class="">
			<div class="row block-category-topo">
				<div class="col-12 col-md-4 -text container">
					<div class="title" {% if category.name == 'responsible' or category.name == 'RESPONSIBLE' or category.name == 'Responsible' %}style="color: #00b858;"{% endif %}>
						{{ category.name }}
					</div>
					<div class="description {% if not category.description %}d-none{% endif %}">
						{{ category.description }}
					</div>
				</div>
				<div class="col-12 col-md-7 -image">
					{% set image_sizes = ['small', 'large', 'huge', 'original', '1080p'] %}
					{% set category_images = {} %}
					{% set has_category_images = category.images is not empty %}
					{% set has_banner_product = 'banner-products.jpg' | has_custom_image %}

					{% if has_category_images %}
						{% for size in image_sizes %}
							{% set category_images = category_images|merge({(size):(category.images | first | category_image_url(size))}) %}
						{% endfor %}
					{% elseif has_banner_product %}
						{% for size in image_sizes %}
							{% set category_images = category_images|merge({(size):('banner-products.jpg' | static_url | settings_image_url(size))}) %}
						{% endfor %}
					{% else %}
					{% if use_defaults %}
						{% set safe_name = category.name|default('Categoria') %}
						{% set placeholder_base = 'https://placehold.co/648x530?text=648x530 : ' ~ (safe_name|url_encode) %}
						{% for size in image_sizes %}
							{% set category_images = category_images|merge({(size):(placeholder_base)}) %}
						{% endfor %}
					{% endif %}
					{% endif %}

					{% set category_image_url = category_images['original'] %}
					<img class="lazyautosizes lazyload blur-up position-relative w-100" src="{{ category_images['small'] }}" data-srcset="{{ category_images['large'] }} 480w, {{ category_images['huge'] }} 640w, {{ category_images['original'] }} 1024w, {{ category_images['1080p'] }} 1920w" data-sizes="auto" alt="{{ 'Banner de la categoría' | translate }} {{ category.name|default('') }}"/>
				</div>
			</div>
		</section>

		<section class="js-category-controls category-controls container visible-when-content-ready">
			<div class="row align-items-center my-md-2" style="padding-top: 8px;">
				<div class="col-12">
					<div class="row">

						<div class="visible-when-content-ready col-12 col-md-4 text-right">
							<div class="row align-items-center">
								{% if has_filters_available %}
									<a href="#" class="js-modal-open mb-1 js-fullscreen-modal-open col-3 d-flex justify-content-start align-items-center" data-toggle="#nav-filters" data-modal-url="modal-fullscreen-filters" data-component="filter-button">
										<div class="text-left ">
											<svg class="icon-inline icon-w-14 icon-lg"><use xlink:href="#filter"/></svg>
										</div>
										<div class="ml-2 font-arial">
											FILTROS
										</div>
									</a>
									{% embed "snipplets/modal.tpl" with{modal_id: 'nav-filters', modal_class: 'filters', modal_position: 'left', modal_transition: 'slide', modal_header: true, modal_width: 'docked-md', modal_mobile_full_screen: 'true' } %}
										{% block modal_head %}
											{{'Filtros ' | translate }}
										{% endblock %}
										{% block modal_body %}
											{% include "snipplets/grid/categories.tpl" with {mobile: true} %}
											{% include "snipplets/grid/filters.tpl" with {mobile: true} %}
											<div class="js-filters-overlay filters-overlay" style="display: none;">
												<div class="filters-updating-message">
													<h3 class="js-applying-filter" style="display: none;">{{ 'Aplicando filtro...' | translate }}</h3>
													<h3 class="js-removing-filter" style="display: none;">{{ 'Borrando filtro...' | translate }}</h3>
												</div>
											</div>
										{% endblock %}
									{% endembed %}
								{% endif %}
								{% if products %}
									<div class="">
										{% include 'snipplets/grid/sort-by.tpl' %}
									</div>
								{% endif %}
								{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
							</div>
						</div>

						<div class="col-4 align-self-center" style='padding-bottom: 6px; padding-right: 0px;'>
							{% include "snipplets/breadcrumbs.tpl" %}
						</div>

						<div class="col-12 col-md-4 d-none d-lg-flex justify-content-end">
							<div class="d-flex justify-content-end block-grid" style="padding-bottom: 4px;">
								<h4 class="align-self-center">VISUALIZAÇÃO: </h4>
								<button type="button" class="icon-grid-3 border-none" data-grid="3">
									<svg class="icon-inline"><use xlink:href="#grid-3"/></svg>
								</button>
								<button type="button" class="icon-grid-4 border-none" data-grid="4">
									<svg class="icon-inline"><use xlink:href="#grid-4"/></svg>
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>

		<div class="container visible-when-content-ready d-none">
			{% include "snipplets/grid/filters.tpl" with {mobile: true, applied_filters: true} %}
		</div>

		<section class="category-body">
			<div class="container-fluid">
				<div
					class="row">
					{# {% if has_filters_available %}
									<div class="col col-md-2 d-none pr-0 d-md-block visible-when-content-ready">
										{% if filter_categories is not empty %}
											{% include "snipplets/grid/categories.tpl" %}
										{% endif %}
										{% if product_filters is not empty %}
											{% include "snipplets/grid/filters.tpl" %}
										{% endif %}
									</div>
								{% endif %} #}
					<div class="col" data-store="category-grid-{{ category.id }}">
						{% if products %}
							<div class="js-product-table row" data-block-grid>
								{% include 'snipplets/product_grid.tpl' with { 'has_banner': true } %}
							</div>
								<!-- código para paginação -->
								<div class='pagination'>
									{% if pages.previous %}
										<a class='icon-pagination' href="{{ pages.previous }}">
											<svg width="31" height="31" viewbox="0 0 31 31" fill="none" xmlns="http://www.w3.org/2000/svg">
												<rect x="0.5" y="0.571289" width="30" height="30" rx="15" fill="white"/>
												<path d="M11.5469 15.6494C11.3828 15.4854 11.3828 15.1846 11.5469 15.0205L16.7969 9.77051C16.9609 9.60645 17.2617 9.60645 17.4258 9.77051C17.5898 9.93457 17.5898 10.2354 17.4258 10.3994L12.4766 15.3213L17.4258 20.2705C17.5898 20.4346 17.5898 20.7354 17.4258 20.8994C17.2617 21.0635 16.9609 21.0635 16.7969 20.8994L11.5469 15.6494Z" fill="black" fill-opacity="0.6"/>
											</svg>
										</a>
									{% endif %}

									{% if pages.next or pages.previous %}
									<p>página</p>
									{% endif %}

									{% for page in pages.numbers %}
										{% if page.selected %}
											<strong>{{ page.number }}</strong>
											<p>de</p>
										{% endif %}
									{% endfor %}

									{% for page in pages.numbers %}
										{% if loop.last %}
											<a href="{{ page.url }}">
												<strong>{{ page.number }}<strong>
											</a>
										{% endif %}
									{% endfor %}

									{% if pages.next %}
									<a class='icon-pagination' href="{{ pages.next }}">
										<svg width="31" height="31" viewbox="0 0 31 31" fill="none" xmlns="http://www.w3.org/2000/svg">
											<rect width="30" height="30" rx="15" transform="matrix(-1 0 0 1 30.5 0.571289)" fill="white"/>
											<path d="M19.4531 15.6494C19.6172 15.4854 19.6172 15.1846 19.4531 15.0205L14.2031 9.77051C14.0391 9.60645 13.7383 9.60645 13.5742 9.77051C13.4102 9.93457 13.4102 10.2354 13.5742 10.3994L18.5234 15.3213L13.5742 20.2705C13.4102 20.4346 13.4102 20.7354 13.5742 20.8994C13.7383 21.0635 14.0391 21.0635 14.2031 20.8994L19.4531 15.6494Z" fill="black" fill-opacity="0.6"/>
										</svg>
									</a>
								{% endif %}
						</div>
						{% else %}
							<h6 class="text-center mt-5" data-component="filter.message">
								{{(has_filters_enabled ? "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
							</h6>
						{% endif %}
					</div>
				</div>
			</div>
		</section>
	{% elseif show_help %}
		{# Category Placeholder #}
		{% include 'snipplets/defaults/show_help_category.tpl' %}
	{% endif %}
