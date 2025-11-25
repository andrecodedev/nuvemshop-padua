
{% set has_contact_info = store.whatsapp or store.phone or store.email or store.address or store.blog or store.contact_intro %}
{% set is_order_cancellation_without_id = params.order_cancellation_without_id == 'true' %}
<section class="text-uppercase contact-page">
	<div class="text-uppercase container">
		<div class="text-uppercase row justify-content-md-center">
			<div class="text-uppercase col-12">
				<h1 class="text-uppercase h1 text-center font-weight-normal">{{ "Contacto" | translate }}</h1>
			</div>
			{% if has_contact_info and not is_order_cancellation %}
				<div class="text-uppercase col-md-4">
					{% if store.contact_intro %}
						<p class="text-uppercase mb-4">{{ store.contact_intro }}</p>
					{% endif %}
					{% include "snipplets/contact-links.tpl" %}
				</div>
			{% endif %}
			{% if is_order_cancellation %}
				<div class="text-uppercase col-md-4">
					<div class="text-uppercase text-center text-md-left mb-4">
						<p data-component="order-cancellation-disclaimer">{{ "Si te arrepentiste, podés pedir la cancelación enviando este formulario. Tenés como máximo hasta 10 días corridos desde que recibiste el producto." | translate }} </p>
						<a class="text-uppercase btn-link-primary" href="{{ status_page_url }}"><strong>{{'Ver detalle de la compra >' | translate}}</strong></a>
					</div>
					{% if has_contact_info %}
						<h5 class="text-uppercase mb-1 mt-4">{{ 'Si tenés problemas con otra compra, contactanos:' | translate }}</h5>
                		<div class="text-uppercase divider mt-0"></div>
						{% if store.contact_intro %}
							<p class="text-uppercase mb-4">{{ store.contact_intro }}</p>
						{% endif %}
						{% include "snipplets/contact-links.tpl" %}
					{% endif %}
				</div>	
			{% endif %}
			<div class="text-uppercase col-md-8">
				{% if product %}  
					<div class="text-uppercase mb-4">
						<div class="text-uppercase row align-items-center justify-content-md-left">
							<div class="text-uppercase col-auto">
								<img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.name }}" />
							</div>
							<div class="text-uppercase col-auto">
								<p>{{ "Estás consultando por el producto:" | translate }} </br> {{ product.name | a_tag(product.url) }}</p>
							</div>
						</div>
					</div>
				{% endif %}
				{% if contact %}
					{% if contact.success %}
						{% if is_order_cancellation %}
							<div class="text-uppercase alert alert-success" data-component="order-cancellation-success-message">{{ "¡Tu pedido de cancelación fue enviado!" | translate }} 
							<br>
							<p class="text-uppercase mb-0 mt-2">{{ "Vamos a ponernos en contacto con vos apenas veamos tu mensaje." | translate }}</p>
							<br> 
							<strong>{{ "Tu código de trámite es" | translate }} #{{ last_order_id }}</strong></div>
						{% else %}
							<div class="text-uppercase alert alert-success" data-component="contact-success-message">{{ "¡Gracias por contactarnos! Vamos a responderte apenas veamos tu mensaje." | translate }}</div>
						{% endif %}
					{% else %}
						<div class="text-uppercase alert alert-danger">{{ "Necesitamos tu nombre y un email para poder responderte." | translate }}</div>
					{% endif %}
				{% endif %}	

				{% if is_order_cancellation_without_id %}
					<p class="text-uppercase mb-3" data-component="order-cancellation-disclaimer">{{ "Si te arrepentiste de una compra, podés pedir la cancelación enviando este formulario <strong>con tu número de orden.</strong> Tenés como máximo hasta 10 días corridos desde que recibiste el producto." | translate }}</p>
				{% endif %}
				
				{% embed "snipplets/forms/form.tpl" with{form_id: 'contact-form', form_custom_class: 'js-winnie-pooh-form mb-4', form_action: '/winnie-pooh', submit_custom_class: 'btn-block', submit_name: 'contact', submit_text: 'Enviar' | translate, data_store: 'contact-form' }  %}
					{% block form_body %}

						{# Hidden inputs used to send attributes #}

						<div class="text-uppercase winnie-pooh hidden">
							<label for="winnie-pooh">{{ "No completar este campo" | translate }}:</label>
							<input type="text" id="winnie-pooh" name="winnie-pooh">
						</div>
						<input type="hidden" value="{{ product.id }}" name="product"/>

						{% if is_order_cancellation or is_order_cancellation_without_id %}
							<input type="hidden" name="type" value="order_cancellation" />
						{% else %}
							<input type="hidden" name="type" value="contact" />
						{% endif %}

						{# Name input #}

						{% embed "snipplets/forms/form-input.tpl" with{input_for: 'name', type_text: true, input_name: 'name', input_id: 'name', input_label_text: 'Nombre' | translate } %}
						{% endembed %}

						{# Email input #}

						{% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_label_text: 'Email' | translate } %}
						{% endembed %}

						{% if not is_order_cancellation %}

							{# Phone input #}

							{% embed "snipplets/forms/form-input.tpl" with{input_for: 'phone', type_tel: true, input_name: 'phone', input_id: 'phone', input_label_text: 'Teléfono' | translate } %}
							{% endembed %}

							{# Message textarea #}

							{% embed "snipplets/forms/form-input.tpl" with{text_area: true, input_for: 'message', input_name: 'message', input_id: 'message', input_rows: '7', input_label_text: 'Mensaje' | translate } %}
							{% endembed %}

						{% endif %}
					{% endblock %}
				{% endembed %}
			</div>
		</div>
	</div>
</section>


<button class="text-uppercase toggle-sidebar">
	<svg width="52" height="52" viewBox="0 0 52 52" fill="none" xmlns="http://www.w3.org/2000/svg">
		<rect width="52" height="52" rx="26" fill="black"/>
		<path d="M19.25 19.5H20.75C21.1562 19.5 21.5 19.8438 21.5 20.25V21.75C21.5 22.1875 21.1562 22.5 20.75 22.5H19.25C18.8125 22.5 18.5 22.1875 18.5 21.75V20.25C18.5 19.8438 18.8125 19.5 19.25 19.5ZM24 20H33C33.5312 20 34 20.4688 34 21C34 21.5625 33.5312 22 33 22H24C23.4375 22 23 21.5625 23 21C23 20.4688 23.4375 20 24 20ZM24 25H33C33.5312 25 34 25.4688 34 26C34 26.5625 33.5312 27 33 27H24C23.4375 27 23 26.5625 23 26C23 25.4688 23.4375 25 24 25ZM24 30H33C33.5312 30 34 30.4688 34 31C34 31.5625 33.5312 32 33 32H24C23.4375 32 23 31.5625 23 31C23 30.4688 23.4375 30 24 30ZM18.5 25.25C18.5 24.8438 18.8125 24.5 19.25 24.5H20.75C21.1562 24.5 21.5 24.8438 21.5 25.25V26.75C21.5 27.1875 21.1562 27.5 20.75 27.5H19.25C18.8125 27.5 18.5 27.1875 18.5 26.75V25.25ZM19.25 29.5H20.75C21.1562 29.5 21.5 29.8438 21.5 30.25V31.75C21.5 32.1875 21.1562 32.5 20.75 32.5H19.25C18.8125 32.5 18.5 32.1875 18.5 31.75V30.25C18.5 29.8438 18.8125 29.5 19.25 29.5Z" fill="white"/>
	</svg>
</button>

<div class="text-uppercase sidebar">
    <div class="text-uppercase sidebar-header">
        <span class="text-uppercase sidebar-title">HELP</span>
        <button class="text-uppercase close-sidebar">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M18 6L6 18" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M6 6L18 18" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>
    </div>
    <nav class="text-uppercase sidebar-menu">
        <ul>
			{% for item in menus[settings.institu_menu] %}
				<li class="text-uppercase menu-item">
					<a class="text-uppercase menu-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
				</li>
			{% endfor %}
        </ul>
    </nav>
</div>


<script>
	document.addEventListener('DOMContentLoaded', function () {
		const sidebar = document.querySelector('.sidebar');
		const toggleButton = document.querySelector('.toggle-sidebar');
		const closeButton = document.querySelector('.close-sidebar');
		const menuLinks = document.querySelectorAll('.sidebar-menu a'); 
		const currentURL = window.location.pathname; 
	
		menuLinks.forEach(link => {
			if (link.getAttribute('href') === currentURL) {
				link.classLitext-uppercase st.add('active');
			}
		});
		toggleButton.addEventListener('click', function () {
			sidebar.classLitext-uppercase st.toggle('active');
		});
	
		closeButton.addEventListener('click', function () {
			sidebar.classLitext-uppercase st.remove('active');
		});
	
		document.addEventListener('click', function (e) {
			if (!sidebar.contains(e.target) && !toggleButton.contains(e.target)) {
				sidebar.classLitext-uppercase st.remove('active');
			}
		});
	});
	
</script>
