{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>


{# Header #}

{% set show_transparent_head = template == 'home' and settings.head_transparent and settings.slider and not settings.slider is empty %}

{% set logo_desktop_class = settings.logo_position_desktop == 'center' ? 'logo-desktop-center' %}

<header class="js-head-main head-main head-{{ settings.head_background }} {% if settings.head_fix %}head-fix{% endif %} transition-soft {{ logo_desktop_class }}" data-store="head">

    {# Topbar = Social + Advertising + Language #}

    {% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
    {% set has_languages = languages | length > 1 %}
    {% set has_ad_bar = settings.ad_bar and settings.ad_text %}
    {% set show_topbar =  has_ad_bar or has_social_network or has_languages %}
    {% if show_topbar %}
        <section class="js-topbar section-topbar {% if not has_ad_bar %}d-none d-md-block{% endif %}">
            <div class="container-fluid">
                <div class="row">
                    <div class="col text-left d-none d-md-block">
                        {# {% include "snipplets/social/social-links.tpl" %} #}
                    </div>
                    {% if has_ad_bar %}
                        {% snipplet "header/header-advertising.tpl" %}
                    {% endif %}
                    <div class="col text-right d-none d-md-block">
                        {% include "snipplets/navigation/navigation-lang.tpl" %}
                    </div>
                </div>
            </div>
        </section>
    {% endif %}
	<div class="header-content container-fluid">
		<div class="{% if not settings.head_fix %}js-nav-logo-bar{% endif %} row no-gutters align-items-center justify-content-between flex-nowrap">

            {# Menu icon for mobile #}
            <div class="col-auto d-block d-lg-none js-header-mobile-trigger">
                <a href="#" class="js-modal-open utilities-link utilities-item" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}" data-component="menu-button">
                    <svg class="icon-inline icon-2x icon-w-14"><use xlink:href="#bars"/></svg>
                </a>
                {% if store.country == 'AR'%}
                    {# Notification icon for quick login on AR stores #}
                    <div class="js-quick-login-badge badge badge-overlap swing" style="display: none;"></div>
                {% endif %}
            </div>

            {# Search icon for mobile and desktop #}
            <div class="col-auto col-lg-2 d-block text-left">
                <button class="js-modal-open-search utilities-link utilities-item" aria-label="{{ 'Buscador' | translate }}">
                    <svg class="icon-inline icon-2x"><use xlink:href="#search"/></svg>
                </button>
            </div>

            {# Logo for mobile and desktop #}

            <div class="nav-desktop col-lg-8 d-none d-lg-flex order-lg-2 align-items-center justify-content-center js-header-desktop-nav">
                <div style="display: inline-grid; grid-template-columns: minmax(min-content, 1fr) auto minmax(min-content, 1fr); align-items: center; gap: 20px; width: fit-content; margin: 0 auto;">
                    <ul class="js-nav-desktop-list nav-desktop-list px-0 text-right" data-store="navigation" data-component="menu">
                        {% include 'snipplets/navigation/navigation-nav-list.tpl' with {'desktop_nav': true, 'navigation': navigation[:(navigation | length) / 2]} %}
                    </ul>

                    <div class="px-3">
                        {% set logo_size_class = settings.logo_size == 'small' ? 'logo-img-small' : settings.logo_size == 'big' ? 'logo-img-big' %}
                        {{ component('logos/logo', {logo_img_classes: 'transition-soft ' ~ logo_size_class, logo_text_classes: 'h5 h3-md mb-0'}) }}
                    </div>


                    <ul class="js-nav-desktop-list nav-desktop-list px-0 text-left" data-store="navigation" data-component="menu">
                        {% include 'snipplets/navigation/navigation-nav-list.tpl' with {'desktop_nav': true, 'navigation': navigation[(navigation | length) / 2:]} %}
                    </ul>
                </div>
            </div>

			<div class="d-block d-lg-none js-header-mobile-logo {% if settings.logo_position_mobile == 'left' %}col text-left{% else %}col text-center{% endif %}">
                {% set logo_size_class = settings.logo_size == 'small' ? 'logo-img-small' : settings.logo_size == 'big' ? 'logo-img-big' %}
                {{ component('logos/logo', {logo_img_classes: 'transition-soft ' ~ logo_size_class, logo_text_classes: 'h5 h3-md mb-0'}) }}
            </div>

            {# Utility icons: Help, Account and Cart #}

			<div class="col-auto col-lg-2 order-lg-3 text-right">
                {% snipplet "header/header-utilities.tpl" %}
                {% if settings.head_fix and settings.ajax_cart %}
                    <div class="d-none d-lg-block">
                        {% include "snipplets/notification.tpl" with {add_to_cart: true} %}
                    </div>
                {% endif %}
            </div>
		</div>
        {% if settings.head_fix and settings.ajax_cart %}
            <div class="d-lg-none">
                {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_mobile: true} %}
            </div>
        {% endif %}
	</div>
    {% include "snipplets/notification.tpl" with {order_notification: true} %}

    {# Search Modal #}
    {% snipplet "header/header-search.tpl" %}

</header>
<script>
    (function() {
        function checkHeaderOverflow() {
            var desktopNav = document.querySelector('.js-header-desktop-nav');
            var mobileTrigger = document.querySelector('.js-header-mobile-trigger');

            if (!desktopNav) return;

            // Reset to check natural width
            document.body.classList.remove('force-hamburger');

            // If strictly hidden by CSS (media query), do nothing
            if (window.getComputedStyle(desktopNav).display === 'none') {
                 return;
            }

            // Check if scrollWidth > clientWidth (content overflows container)
            // or if the content is wrapping (height increases) - but here flex-wrap might be nowrap

            // More robust: Check if nav items fit in the available width
            // For col-8, if content is larger, it might shrink or overflow.

            // Simple heuristic: If scrollWidth > clientWidth, it's definitely overflowing.
            if (desktopNav.scrollWidth > desktopNav.clientWidth + 2) {
                 document.body.classList.add('force-hamburger');
            }
        }

        window.addEventListener('load', checkHeaderOverflow);
        window.addEventListener('resize', checkHeaderOverflow);
        // Also run on DOMContentLoaded
        document.addEventListener('DOMContentLoaded', checkHeaderOverflow);
    })();
</script>

{# Show cookie validation message #}

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{# Add notification for quick login cancellation #}

{% if template == 'home' or template == 'product' %}
    {% include "snipplets/notification.tpl" with {show_quick_login: true} %}
{% endif %}

{# Add to cart notification for non fixed header #}

{% if not settings.head_fix and settings.ajax_cart %}
    {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
{% endif %}

{# Quick login modal #}

{% embed "snipplets/modal.tpl" with{modal_id: 'quick-login', modal_class: 'bottom modal-centered-small', modal_position: 'center', modal_transition: 'slide', modal_header: false, modal_footer: false, modal_width: 'centered', modal_zindex_top: true, modal_close_class: 'float-right mr-0'} %}
    {% block modal_body %}
        <div class="text-center h5 mt-3">{{ "¡Qué bueno verte de nuevo!" | translate }}</div>
        <div class="text-center p-2">{{ "Iniciá sesión para comprar más rápido y ver todos tus pedidos." | translate }}</div>
        {% embed "snipplets/forms/form.tpl" with{form_id: 'quick-login-form', form_action: '/account/login/', submit_custom_class: 'btn-block', submit_text: 'Iniciar sesión' | translate, data_store: 'account-login' } %}
            {% block form_body %}
                {% embed "snipplets/forms/form-input.tpl" with{type_hidden: true, input_value: current_url, input_name: 'redirect_to'} %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{type_hidden: true, input_value: 'quick-login', input_name: 'from'} %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_value: result.email, input_name: 'email', input_custom_class: 'js-account-input', input_label_text: 'Email' | translate } %}{% endembed %}
                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'password', type_password: true, input_name: 'password', input_custom_class: 'js-account-input', input_help: true, input_help_link: store.customer_reset_password_url, input_link_class: 'btn-link-primary font-small float-right mb-4 mt-3n', input_label_text: 'Contraseña' | translate } %}{% endembed %}
            {% endblock %}
        {% endembed %}
    {% endblock %}
{% endembed %}

{# Hamburger panel #}

{% embed "snipplets/modal.tpl" with {modal_id: 'nav-hamburger',modal_class: 'nav-hamburger head-'~ settings.head_background ~ ' modal-docked-small', modal_position: 'left', modal_transition: 'fade', modal_width: 'full', modal_topbar: true, modal_fixed_footer: true, modal_footer: true, modal_footer_class: 'p-0' } %}
    {% block modal_topbar %}
        {% snipplet "navigation/navigation-topbar.tpl" %}
    {% endblock %}
    {% block modal_body %}
        {% include "snipplets/navigation/navigation-panel.tpl" with {primary_links: true} %}
    {% endblock %}
    {% block modal_foot %}
        {% include "snipplets/navigation/navigation-panel.tpl" %}
    {% endblock %}
{% endembed %}
{# Notifications #}

{# Modal Search #}

{% if not store.is_catalog and settings.ajax_cart and template != 'cart' %}

    {# Cart Ajax #}

    {% embed "snipplets/modal.tpl" with{modal_id: 'modal-cart', modal_position: 'right', modal_transition: 'slide', modal_width: 'docked-md', modal_form_action: store.cart_url, modal_form_class: 'js-ajax-cart-panel', modal_header: true, modal_mobile_full_screen: true, modal_form_hook: 'cart-form', data_component:'cart' } %}
        {% block modal_head %}
            {% block page_header_text %}{{ "Carrito de Compras" | translate }}{% endblock page_header_text %}
        {% endblock %}
        {% block modal_body %}
            {% snipplet "cart-panel.tpl" %}
        {% endblock %}
    {% endembed %}

{% endif %}
