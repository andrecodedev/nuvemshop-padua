{# {% if product.variations %}
    {% set own_color_variants = 0 %}
    {% set custom_color_variants = 0 %}

    {% for variation in product.variations %}
        <div class="js-color-variant-available-{{ loop.index }} {% if variation.name in ['Color', 'Cor'] %}js-color-variant-active{% endif %}" data-value="variation_{{ loop.index }}" data-option="{{ loop.index0 }}" >
            {% if variation.name in ['Color', 'Cor'] %}
                {% if variation.options | length > 1 %}
                    <div class="item-colors">
                        <a href="{{ product_url_with_selected_variant }}" class="item-colors-bullet d-md-none w-auto px-2">{{ variation.options | length }} {{ 'colores' | translate }}</a>
                        <div class="d-none d-md-block">
                            {% for option in variation.options | take(5) if option.custom_data %}
                                <span title="{{ option.name }}" data-option="{{ option.id }}" class="js-color-variant item-colors-bullet" style="background: {{ option.custom_data }}"></span>
                            {% endfor %}

                            {% for option in variation.options %}
                                {% if option.custom_data %}
                                    {% set own_color_variants = own_color_variants + 1 %}
                                {% else %}
                                    {% set custom_color_variants = custom_color_variants + 1 %}
                                {% endif %}
                            {% endfor %}

                            {% set more_color_variants = (own_color_variants - 5) + custom_color_variants %}

                            {% if own_color_variants and custom_color_variants %}
                                <a href="{{ product_url_with_selected_variant }}" class="item-colors-bullet w-auto" title="{{ 'Ver más colores' | translate }}">
                                    {% if own_color_variants > 5 %}
                                        +{{ more_color_variants }}
                                    {% else %}
                                        +{{ custom_color_variants }}
                                    {% endif %}
                                </a>
                            {% elseif own_color_variants > 5 %}
                                <a href="{{ product_url_with_selected_variant }}" class="item-colors-bullet w-auto" title="{{ 'Ver más colores' | translate }}">+{{ own_color_variants - 5 }}</a>
                            {% elseif custom_color_variants %}
                                <a href="{{ product_url_with_selected_variant }}" class="item-colors-bullet w-auto px-2" title="{{ 'Ver más colores' | translate }}">{{ custom_color_variants }} {{ 'colores' | translate }}</a>
                            {% endif %}
                        </div>
                    </div>
                {% endif %}
            {% endif %}
        </div>
    {% endfor %}
{% endif %} #}

<div class="js-product-variants-colors {% if quickshop %}js-product-quickshop-variants mb-1{% endif %} form-row mx-0 pt-2 row  px-2">
	{% set has_size_variations = false %}
	{% if true %}
		{% set hidden_variant_select = ' d-none' %}
	{% endif %}

	{% for variation in product.variations %}
        {% if variation.name in ['Color', 'Cor'] %}
           
				<div class="js-color-variant-available-{{ loop.index }} js-color-variant-active js-product-variants-group col-12 js-color-variants-container{% if quickshop %}row {% else %} col-12 {% if true %}mb-2{% else %}{% if loop.length == 3 %} col-md-4 {% else %} col-md-6{% endif %}{% endif %}{% endif %}" data-variation-id="{{ variation.id }}">
					
	
					{% if quickshop %}
						{% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: '' ~ variation.name ~ '', select_for: 'variation_' ~ loop.index , select_id: 'variation_' ~ loop.index, select_name: 'variation' ~ '[' ~ variation.id ~ ']', select_group_custom_class: 'form-group-small mb-2' ~ hidden_variant_select, select_custom_class: 'js-variation-option js-refresh-installment-data form-control-small', select_label_custom_class:'mb-1'} %}
							{% block select_options %}
								{% for option in variation.options %}
									<option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
								{% endfor %}
							{% endblock select_options%}
						{% endembed %}
					{% else %}
						{% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: '' ~ variation.name ~ '', select_for: 'variation_' ~ loop.index , select_id: 'variation_' ~ loop.index, select_name: 'variation' ~ '[' ~ variation.id ~ ']', select_custom_class: 'js-variation-option js-refresh-installment-data', select_group_custom_class: hidden_variant_select} %}
							{% block select_options %}
								{% for option in variation.options %}
									<option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
								{% endfor %}
							{% endblock select_options%}
						{% endembed %}
					{% endif %}
					{% if true %}
						<div class="item-colors">
							<div class="item-colors-bullet">
								{% for option in variation.options if option.custom_data %}
									<a data-option="{{ option.id }}" class="js-insta-variant btn btn-variant  {% if product.default_options[variation.id] == option.id %} selected{% endif %}" title="{{ option.name }}" data-option="{{ option.id }}" data-variation-id="{{ variation.id }}">
										<span  class="js-color-variant item-colors-bullet btn-variant-content"{% if variation.name in ['Color', 'Cor'] %} style="background: {{ option.custom_data }};{% if  option.custom_data matches '/^#FFFFFF:/' %}border: 1px solid #707070;{% endif %}"{% endif %} data-name="{{ option.name }}">
										{% if not(variation.name in ['Color', 'Cor']) %}
											{{ option.name }}
										{% endif %}
										</span>
									</a>
									
								{% endfor %}
								{% for option in variation.options if not option.custom_data %}
									<a data-option="{{ option.id }}" class="js-insta-variant btn btn-variant{% if product.default_options[variation.id] == option.id %} selected{% endif %}" data-variation-id="{{ variation.id }}">
										<span class="btn-variant-content" data-name="{{ option.name }}">{{ option.name }}</span>
									</a>
								{% endfor %}
							</div>
						</div>
					{% endif %}
					{% if quickshop %}
						{% if loop.last %}
							{# {% include "snipplets/product/product-quantity.tpl" with{'quick_shop': true} %} #}
						{% endif %}
					{% endif %}
				</div>
        {% endif %}
    {% endfor %}
</div>