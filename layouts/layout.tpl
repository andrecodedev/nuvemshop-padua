<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}">
    <head>
        <link rel="preconnect" href="{{ store_resource_hints }}" />
        <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>{{ page_title }}</title>
        <meta name="description" content="{{ page_description }}" />

        {# Preload of first image of Slider to improve LCP #}
        {% if template == 'home'%}
            {% snipplet 'preload-images.tpl' %}
        {% endif %}

        {{ component('social-meta') }}
        {{ component('canary') }}

        {#/*============================================================================
            #CSS and fonts
        ==============================================================================*/#}

        {# Critical CSS needed to show first elements of store while CSS async is loading #}

        <style>
            {# Font families #}

            {% if params.preview %}

                {# If page is loaded from customization page on the admin, load all fonts #}

                @import url('https://fonts.googleapis.com/css?family=Muli:400,700|Lato:400,700|Open+Sans:400,700|Lora:400,700|Slabo+27px|Playfair+Display:400,700|Droid+Sans:400,700|Montserrat:400,700|Nunito:400,700|Fredoka+One');

            {% else %}

                {# If page is NOT loaded from customization only load saved fonts #}

                {# Get only the saved fonts on settings #}

                @import url('{{ [settings.font_headings, settings.font_rest] | google_fonts_url('400, 500, 600, 700') | raw  }}');

            {% endif %}


            {% include "static/css/style-critical.tpl" %}
        </style>

        {# Colors and fonts used from settings.txt and defined on theme customization #}

        {{ 'css/style-colors.scss.tpl' | static_url | static_inline }}

        {# Load async styling not mandatory for first meaningfull paint #}

        <link rel="stylesheet" href="{{ 'css/style-async.scss.tpl' | static_url }}" media="print" onload="this.media='all'">
        
        <link rel="stylesheet" href="{{ 'css/css-tec4u.scss.tpl' | static_url }}" media="print" onload="this.media='all'">

        {# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

        <style>
            {{ settings.css_code | raw }}
        </style>

        {#/*============================================================================
            #Javascript: Needed before HTML loads
        ==============================================================================*/#}

        {# Defines if async JS will be used by using script_tag(true) #}

        {% set async_js = true %}

        {# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

        {% set nojquery = true %}

        {# Jquery async by adding script_tag(true) #}

        {% if load_jquery %}

            {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}

        {% endif %}

        {# Loads private Tiendanube JS #}

        {% head_content %}

        {# Structured data to provide information for Google about the page content #}

        {{ component('structured-data') }}

    </head>
    <body class="{% if settings.head_fix %}js-head-offset head-offset{% endif %} {% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}" data-rounded-borders="{{ settings.theme_rounded ? 'true' : 'false' }}" data-solid-icons="{{ settings.icons_solid ? 'true' : 'false' }}">

        {# Theme icons #}

        {% include "snipplets/svg/icons.tpl" %}

        {% if settings.icons_solid %}
            {% include "snipplets/svg/icons-solid.tpl" %}
        {% else %}
            {% include "snipplets/svg/icons-regular.tpl" %}
        {% endif %}

        {# Facebook comments on product page #}

        {% if template == 'product' %}

            {# Facebook comment box JS #}
            {% if settings.show_product_fb_comment_box %}
                {{ fb_js }}
            {% endif %}

            {# Pinterest share button JS #}
            {{ pin_js }}

        {% endif %}

        {# Back to admin bar #}

        {{back_to_admin}}

        {# Header = Advertising + Nav + Logo + Search + Ajax Cart #}

        {% snipplet "header/header.tpl" %}

        {# Page content #}

        {% if template != 'home' or (template == 'home' and settings.slider is empty) %}

        <div class="mt-4">

        {% endif %}

            {% template_content %}

        {% if template != 'home' or (template == 'home' and settings.slider and settings.slider is not empty) %}

        </div>

        {% endif %}

        {# WhatsApp chat button #}

        {% snipplet "whatsapp-chat.tpl" %}

        {# Footer #}

        {% snipplet "footer/footer.tpl" %}

        {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

            {# Minimum used for free shipping progress messages. Located on header so it can be accesed everywhere with shipping calculator active or inactive #}

            <span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
            <span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
            <span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
        {% endif %}

        {#/*============================================================================
            #Javascript: Needed after HTML loads
        ==============================================================================*/#}

        {# Javascript used in the store #}

        <script type="text/javascript">

            {# Libraries that do NOT depend on other libraries, e.g: Jquery #}

            {% include "static/js/external-no-dependencies.js.tpl" %}

            {# LS.ready.then function waits to Jquery and private Tiendanube JS to be loaded before executing what´s inside #}

            LS.ready.then(function(){

                {# Libraries that requires Jquery to work #}

                {% include "static/js/external.js.tpl" %}

                {# Specific store JS functions: product variants, cart, shipping, etc #}

                {% if store.useStoreJsV2() %}
                    {% include "static/js/store-v2.js.tpl" %}
                {% else %}
                    {% include "static/js/store.js.tpl" %}
                {% endif %}
            });
        </script>

        {# Google reCAPTCHA on register page #}

        {% if template == 'account.register' %}
            {% if not store.hasContactFormsRecaptcha() %}
                {{ '//www.google.com/recaptcha/api.js' | script_tag(true) }}
            {% endif %}
            <script type="text/javascript">
                var recaptchaCallback = function() {
                    jQueryNuvem('.js-recaptcha-button').prop('disabled', false);
                };
            </script>
        {% endif %}

        {# Google survey JS for Tiendanube Survey #}

        {% include "static/js/google-survey.js.tpl" %}

        {# Store external codes added from admin #}

        {{ component('assorted-js', {}) }}

        <!-- Botão flutuante do WhatsApp -->
        {% if settings.whatsapp_float %}    
            <a href="{{ settings.whatsapp_link }}" target="_blank" class="whatsapp-float">
                <svg width="60" height="60" viewBox="0 0 60 60" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect width="60" height="60" rx="30" fill="black"/>
                    <path d="M37.3125 22.5938C39.2812 24.5625 40.5 27.1406 40.5 29.9531C40.5 35.6719 35.7188 40.3594 29.9531 40.3594C28.2188 40.3594 26.5312 39.8906 24.9844 39.0938L19.5 40.5L20.9531 35.1094C20.0625 33.5625 19.5469 31.7812 19.5469 29.9062C19.5469 24.1875 24.2344 19.5 29.9531 19.5C32.7656 19.5 35.3906 20.625 37.3125 22.5938ZM29.9531 38.5781C34.7344 38.5781 38.7188 34.6875 38.7188 29.9531C38.7188 27.6094 37.7344 25.4531 36.0938 23.8125C34.4531 22.1719 32.2969 21.2812 30 21.2812C25.2188 21.2812 21.3281 25.1719 21.3281 29.9062C21.3281 31.5469 21.7969 33.1406 22.6406 34.5469L22.875 34.875L21.9844 38.0625L25.2656 37.1719L25.5469 37.3594C26.9062 38.1562 28.4062 38.5781 29.9531 38.5781ZM34.7344 32.1094C34.9688 32.25 35.1562 32.2969 35.2031 32.4375C35.2969 32.5312 35.2969 33.0469 35.0625 33.6562C34.8281 34.2656 33.7969 34.8281 33.3281 34.875C32.4844 35.0156 31.8281 34.9688 30.1875 34.2188C27.5625 33.0938 25.875 30.4688 25.7344 30.3281C25.5938 30.1406 24.7031 28.9219 24.7031 27.6094C24.7031 26.3438 25.3594 25.7344 25.5938 25.4531C25.8281 25.1719 26.1094 25.125 26.2969 25.125C26.4375 25.125 26.625 25.125 26.7656 25.125C26.9531 25.125 27.1406 25.0781 27.375 25.5938C27.5625 26.1094 28.125 27.375 28.1719 27.5156C28.2188 27.6562 28.2656 27.7969 28.1719 27.9844C27.7031 28.9688 27.1406 28.9219 27.4219 29.3906C28.4531 31.125 29.4375 31.7344 30.9844 32.4844C31.2188 32.625 31.3594 32.5781 31.5469 32.4375C31.6875 32.25 32.2031 31.6406 32.3438 31.4062C32.5312 31.125 32.7188 31.1719 32.9531 31.2656C33.1875 31.3594 34.4531 31.9688 34.7344 32.1094Z" fill="white"/>
                </svg>
            </a>
        {% endif %}
    </body>
</html>
