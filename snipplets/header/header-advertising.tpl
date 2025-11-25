{% if settings.ad_bar and settings.ad_text %}
    <div class="col col-md-6 font-small text-center">
        {% if settings.ad_url %}
            <a class="link-contrast" href="{{ settings.ad_url|setting_url }}">
        {% endif %}
        <div class="swiper-advertising swiper-container">
            <div class="swiper-wrapper">
                {% set ad_slides = settings.ad_text|split('|') %}
                {% for slide_text in ad_slides %}
                    <div class="swiper-slide">
                        {{ slide_text|trim }}
                    </div>
                {% endfor %}
            </div>
            <!-- Caso necessite de paginação / navegação do Swiper -->
            <div class="swiper-pagination"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
        {% if settings.ad_url %}
            </a>
        {% endif %}
    </div>
{% endif %}
    
<script>
        
document.addEventListener('DOMContentLoaded', function() {
    var mySwiper = new Swiper('.swiper-advertising', {
        loop: true,               
        speed: 500,              
        autoplay: {
          delay: 3000,           
          disableOnInteraction: false
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true       
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
});

</script>