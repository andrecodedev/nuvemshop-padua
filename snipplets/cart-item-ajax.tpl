<div class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} {% if cart_page %}row align-items-md-center{% else %}cart-item form-row{% endif %}" data-item-id="{{ item.id }}" data-store="cart-item-{{ item.product.id }}" data-component="cart.line-item">

	{% set show_free_shipping_label = item.product.free_shipping and not (cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price) %}
	{% set compare_at_price = item.product.compare_at_price %}

	{# Cart item image #}
	<div class="{% if cart_page %}col-3 col-md-1{% else %}col-3{% endif %}">
		<a class="image-cart" href="{{ item.url }}">
			<img src="{{ item.featured_image | product_image_url('medium') }}" class="img-fluid{% if settings.theme_rounded %} box-rounded-small{% endif %}"/>
		</a>
	</div>
	<div class="{% if cart_page %}col-9 col-md-10 pl-0 pl-md-3{% else %}col-9 d-flex align-items-center{% endif %}">

		<div
			class="{% if cart_page %}row align-items-md-center{% else %}row w-100{% endif %}" style="height: 100%">
			{# Cart item name #}
			<h6 class="{% if cart_page %}col-10 col-md-5 h4-md font-weight-normal mb-3 mb-md-0{% else %} col-12 cart-item-name{% endif %}" data-component="line-item.name">
				<a href="{{ item.url }}" data-component="name.short-name">
					{{ item.short_name }}
				</a>

        <div class="d-flex align-items-center">
          <small class="variacao-name mr-2" data-component="name.short-variant-name">COR: {{ item.product.selected_variant.option1 }}</small>
          <svg width="3" height="2" viewBox="0 0 3 2" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M1.50413 1.58C1.30413 1.58 1.13613 1.516 1.00013 1.388C0.872125 1.252 0.808125 1.088 0.808125 0.896C0.808125 0.696 0.872125 0.532 1.00013 0.404C1.13613 0.276 1.30413 0.212 1.50413 0.212C1.69613 0.212 1.85613 0.276 1.98413 0.404C2.12013 0.532 2.18813 0.696 2.18813 0.896C2.18813 1.088 2.12013 1.252 1.98413 1.388C1.85613 1.516 1.69613 1.58 1.50413 1.58Z" fill="black"/>
          </svg>            
          <small class="variacao-name ml-2" data-component="name.short-variant-name">TAMANHO: {{ item.product.selected_variant.option2 }}</small>
        </div>

				{% if show_free_shipping_label %}
					<div class="my-1">
						<span class="label label-accent label-small font-smallest">{{ "Envío gratis" | translate }}</span>
					</div>
				{% endif %}
			</h6>

			<div class="col-12">
				{# Cart item subtotal #}
				<div class="{% if cart_page %}col col-md-2 text-right text-md-center mb-0{% else %}cart-item-subtotal{% endif %} {% if cart_page and not compare_at_price %}mt-2{% elseif compare_at_price %}m-0{% endif %}">
					{% if compare_at_price %}
						<div class="cart-compare-price-container">
							<span class="text-accent font-small font-weight-bold mr-1">-{{ item.product.promotional_price_percentage | round }}%</span>
							<span class="js-cart-item-subtotal-compare-price price-compare font-small opacity-50 mr-0" data-line-item-id="{{ item.id }}" data-component="subtotal_compare_price.value" data-component-value='{{ item.compare_at_price_subtotal | money }}'>{{ item.compare_at_price_subtotal | money }}</span>
						</div>
					{% endif %}
					<div class="js-cart-item-subtotal {% if cart_page %}h5 h4-md{% else %}h6 font-weight-normal{% endif %} {% if compare_at_price %}mt-1{% endif %}" data-line-item-id="{{ item.id }}" data-component="subtotal.value" data-component-value='{{ item.subtotal | money }}'>{{ item.subtotal | money }}</div>
				</div>
			</div>
			{% if cart_page %}
				{% set cart_quantity_class = 'float-md-none m-auto ' %}
			{% else %}
				{% set cart_quantity_class = 'float-left ' %}
			{% endif %}
      
      <div class="col-12 mt-auto d-flex align-items-center">
        {# Cart item quantity controls #}
        <div class="cart-item-quantity {% if cart_page %}col-auto col-md-3 text-center{% endif %}" data-component="line-item.subtotal">
          {% embed "snipplets/forms/form-input.tpl" with{
            type_number: true, 
            input_value: item.quantity, 
            input_name: 'quantity[' ~ item.id ~ ']', 
            input_data_attr: 'item-id',
            input_data_val: item.id,
            input_group_custom_class: cart_quantity_class ~ 'form-quantity cart-item-quantity small mb-0', 
            input_custom_class: 'js-cart-quantity-input text-center h6', 
            input_label: false, input_append_content: true, 
            data_component: 'quantity.value',
            form_control_container_custom_class: 'col'} %}
            {% block input_prepend_content %}
              <div class="row m-0 align-items-center ">
                <span class="js-cart-quantity-btn form-quantity-icon btn" onclick="LS.minusQuantity({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="quantity.minus">
                  <svg class="icon-inline icon-w-12 svg-icon-primary"><use xlink:href="#minus"/></svg>
                </span>
              {% endblock input_prepend_content %}
              {% block input_append_content %}

                {# Always place this spinner before the quantity input #}

                <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
                  <svg class="icon-inline icon-spin svg-icon-primary"><use xlink:href="#circle-notch"/></svg>
                </span>

                <span class="js-cart-quantity-btn form-quantity-icon btn" onclick="LS.plusQuantity({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="quantity.plus">
                  <svg class="icon-inline icon-w-12 svg-icon-primary"><use xlink:href="#plus"/></svg>
                </span>
              </div>
            {% endblock input_append_content %}
          {% endembed %}
        </div>

        {# Cart item delete #}
        <div class="cart-item-delete position-relative">
          <button type="button" class="btn {% if cart_page %}h6 h5-md mb-0{% endif %}" onclick="LS.removeItem({{ item.id }}{% if not cart_page %}, true{% endif %})" data-component="line-item.remove">
            Remover
          </button>
        </div>
      </div>

			{% if cart_page %}
				{# Cart item unit price #}
				<div class="cart-item-subtotal-short col-2 mb-0 {% if not compare_at_price %}mt-2{% endif %} text-center font-weight-normal d-none d-md-block">
					{% if compare_at_price %}
						<div class="cart-compare-price-container">
							<span class="text-accent font-small font-weight-bold mr-1">-{{ item.product.promotional_price_percentage | round }}%</span>
							<span class="price-compare font-small opacity-50 mr-0" data-component="compare_price.value" data-component-value='{{ compare_at_price | money }}'>{{ compare_at_price | money }}</span>
						</div>
					{% endif %}
					<div class="h4 font-weight-normal {% if compare_at_price %}mt-1{% endif %}" data-line-item-id="{{ item.id }}">{{ item.unit_price | money }}</div>
				</div>
			{% endif %}

		</div>
	</div>

	{% if cart_page %}
		<div class="col-12">
			<div class="divider"></div>
		</div>
	{% endif %}
</div>
