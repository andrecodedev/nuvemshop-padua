{% if applied_filters %}

    {# Applied filters chips

    {# Show subtitle only for mobile applied filters #}
    {% if has_applied_filters %}
        <div class="apply-filters">
            <a href="#" class="js-remove-all-filters btn-link btn-link-primary text-left d-inline-block mb-1" data-component="filter-delete">{{ 'Borrar filtros' | translate }}</a> 
            <div class="d-flex">
                {% for product_filter in product_filters %}
                    {% for value in product_filter.values %}

                        
                        {% if value.selected %}
                            <button class="js-remove-filter chip" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.pill-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                                {{ value.pill_label }}
                                <svg class="icon-inline chip-remove-icon"><use xlink:href="#times"/></svg>
                            </button>
                        {% endif %}
                    {% endfor %}
                {% endfor %}
            </div>
        </div>
    {% endif %} 
{% else %}

    {% if product_filters is not empty %}

        <div id="filters" class="visible-when-content-ready" data-store="filters-nav">

            {% if not mobile %}
                <h3 class="title-section mb-2 d-none d-md-flex">
                    <svg width="20" height="19" viewBox="0 0 20 19" fill="none" xmlns="http://www.w3.org/2000/svg" class="icon-inline mr-2">
                    <path d="M0 15.75C0 15.0859 0.546875 14.5 1.25 14.5H3.35938C3.86719 13.4062 4.96094 12.625 6.25 12.625C7.5 12.625 8.63281 13.4062 9.10156 14.5H18.75C19.4141 14.5 20 15.0859 20 15.75C20 16.4531 19.4141 17 18.75 17H9.10156C8.63281 18.1328 7.5 18.875 6.25 18.875C4.96094 18.875 3.86719 18.1328 3.35938 17H1.25C0.546875 17 0 16.4531 0 15.75ZM5 15.75C5 16.4531 5.54688 17 6.25 17C6.91406 17 7.5 16.4531 7.5 15.75C7.5 15.0859 6.91406 14.5 6.25 14.5C5.54688 14.5 5 15.0859 5 15.75ZM12.5 9.5C12.5 10.2031 13.0469 10.75 13.75 10.75C14.4141 10.75 15 10.2031 15 9.5C15 8.83594 14.4141 8.25 13.75 8.25C13.0469 8.25 12.5 8.83594 12.5 9.5ZM13.75 6.375C15 6.375 16.1328 7.15625 16.6016 8.25H18.75C19.4141 8.25 20 8.83594 20 9.5C20 10.2031 19.4141 10.75 18.75 10.75H16.6016C16.1328 11.8828 15 12.625 13.75 12.625C12.4609 12.625 11.3672 11.8828 10.8594 10.75H1.25C0.546875 10.75 0 10.2031 0 9.5C0 8.83594 0.546875 8.25 1.25 8.25H10.8594C11.3672 7.15625 12.4609 6.375 13.75 6.375ZM7.5 4.5C8.16406 4.5 8.75 3.95312 8.75 3.25C8.75 2.58594 8.16406 2 7.5 2C6.79688 2 6.25 2.58594 6.25 3.25C6.25 3.95312 6.79688 4.5 7.5 4.5ZM10.3516 2H18.75C19.4141 2 20 2.58594 20 3.25C20 3.95312 19.4141 4.5 18.75 4.5H10.3516C9.88281 5.63281 8.75 6.375 7.5 6.375C6.21094 6.375 5.11719 5.63281 4.60938 4.5H1.25C0.546875 4.5 0 3.95312 0 3.25C0 2.58594 0.546875 2 1.25 2H4.60938C5.11719 0.90625 6.21094 0.125 7.5 0.125C8.75 0.125 9.88281 0.90625 10.3516 2Z" fill="#D6418B"/>
                    </svg>
                    {{ "Filtrar por" | translate }}</h3>
            {% endif %}

            {# Filters list #}
            <div class="visible-when-content-ready col text-left mb-3 d-flex flex-column justify-content-start align-items-start">
                {% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
            </div>

            {% if filter_categories %}

                {% if mobile %}
                    {% set btn_classes = 'btn-small py-1 px-2' %}
                {% else %}
                    {% set btn_classes = 'btn-extra-small' %}
                {% endif %}
                
                <div class="mb-2">
                    <div class="my-1 h6">{{ "Categorías" | translate }}</div>
                    <div class="filter-content">
                        {% for category in filter_categories %}
                            <label class="js-filter-checkbox " >
                                <span data-item="{{ loop.index }}" class="mb-3">
                                    <a href="{{ category.url }}" title="{{ category.name }}" class="btn-link {% if mobile %}btn-link-primary font-weight-normal{% endif %}">
                                        {{ category.name }}
                                    </a>
                                </span>
                            </label>
                        {% endfor %}

                    </div>
                </div>
            {% endif %}

            {% if mobile %}
                {% set btn_classes = 'btn-small' %}
                {% set btn_price_classes = 'btn-small' %}
            {% else %}
                {% set btn_classes = 'btn-extra-small' %}
                {% set btn_price_classes = 'btn-small-extra btn-circle btn-icon chevron' %}
            {% endif %}

            {% for product_filter in product_filters %}

                {% if product_filter.type == 'price' %}

                    {{ component(
                        'price-filter',
                        {'group_class': 'mb-2', 'title_class': 'h6 my-1', 'button_class': 'btn btn-primary ' ~ btn_price_classes }
                    ) }}

                {% else %}
                    {% if product_filter.has_products %}
                        <div class="mb-2" data-store="filters-group" data-component="list.filter-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                            <div class="my-1 h6">{{product_filter.name}}</div>

                            <div class="filter-content">
                                {% set index = 0 %}
                                {% for value in product_filter.values %}
                                    {% set hidden_items_threshold = product_filter.values_with_products > 8 %}
                                    {% if value.product_count > 0 %}
                                        {% set index = index + 1 %}

                                        <label class="js-filter-checkbox {% if not value.selected %}js-apply-filter{% else %}js-remove-filter{% endif %} checkbox-container" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.option" data-component-value="{{ value.name }}">
                                            <input type="checkbox" autocomplete='off' {% if value.selected %}checked{% endif %}/>
                                            <span class="checkbox">
                                                <span class="checkbox-icon"></span>
                                                <span class="{% if not mobile %}font-small{% endif %} checkbox-text with-color">
                                                    {{ value.name }} ({{ value.product_count }})
                                                </span>
                                                {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}
                                                    <span class="checkbox-color" style="background-color: {{ value.color_hexa }};"></span>
                                                {% endif %}
                                            </span>
                                        </label>
                                        {% if index == 8 and hidden_items_threshold %}
                                            <div class="js-accordion-container" style="display: none;">
                                        {% endif %}
                                    {% endif %}
                                    {% if loop.last and hidden_items_threshold %}
                                        </div>
                                        <a href="#" class="js-accordion-toggle d-inline-block btn btn-secondary {{ btn_classes }} mt-2">
                                            <span class="js-accordion-toggle-inactive">{{ 'Ver todos' | translate }}</span>
                                            <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                                        </a>
                                    {% endif %}
                                {% endfor %}
                            </div>
                        </div>
                    {% endif %}
                {% endif %}
            {% endfor %}
        </div>
    {% endif %}
{% endif %}
