{% if 'about' in page.url %}
	{% include 'snipplets/paginas_institu/about.tpl' %}
{% elseif 'press' in page.url %}
	{% include 'snipplets/paginas_institu/press.tpl' %}
{% else %}

	<!-- Institutional page -->
	<section class="user-content pb-5">
		<h2>{{ page.name }}</h2>
		
		<div class="justify-content-md-center">
			{{ page.content }}
		</div>
    </section>

{% endif %}

<button class="toggle-sidebar">
	<svg width="52" height="52" viewBox="0 0 52 52" fill="none" xmlns="http://www.w3.org/2000/svg">
		<rect width="52" height="52" rx="26" fill="black"/>
		<path d="M19.25 19.5H20.75C21.1562 19.5 21.5 19.8438 21.5 20.25V21.75C21.5 22.1875 21.1562 22.5 20.75 22.5H19.25C18.8125 22.5 18.5 22.1875 18.5 21.75V20.25C18.5 19.8438 18.8125 19.5 19.25 19.5ZM24 20H33C33.5312 20 34 20.4688 34 21C34 21.5625 33.5312 22 33 22H24C23.4375 22 23 21.5625 23 21C23 20.4688 23.4375 20 24 20ZM24 25H33C33.5312 25 34 25.4688 34 26C34 26.5625 33.5312 27 33 27H24C23.4375 27 23 26.5625 23 26C23 25.4688 23.4375 25 24 25ZM24 30H33C33.5312 30 34 30.4688 34 31C34 31.5625 33.5312 32 33 32H24C23.4375 32 23 31.5625 23 31C23 30.4688 23.4375 30 24 30ZM18.5 25.25C18.5 24.8438 18.8125 24.5 19.25 24.5H20.75C21.1562 24.5 21.5 24.8438 21.5 25.25V26.75C21.5 27.1875 21.1562 27.5 20.75 27.5H19.25C18.8125 27.5 18.5 27.1875 18.5 26.75V25.25ZM19.25 29.5H20.75C21.1562 29.5 21.5 29.8438 21.5 30.25V31.75C21.5 32.1875 21.1562 32.5 20.75 32.5H19.25C18.8125 32.5 18.5 32.1875 18.5 31.75V30.25C18.5 29.8438 18.8125 29.5 19.25 29.5Z" fill="white"/>
	</svg>
</button>

<div class="sidebar">
    <div class="sidebar-header">
        <span class="sidebar-title">HELP</span>
        <button class="close-sidebar">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M18 6L6 18" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M6 6L18 18" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>
    </div>
    <nav class="sidebar-menu">
        <ul>
			{% for item in menus[settings.institu_menu] %}
				<li class="menu-item">
					<a class="menu-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
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
			if (link.getAttribute('href').includes(currentURL) ) {
				link.classList.add('active');
			}
		});
		toggleButton.addEventListener('click', function () {
			sidebar.classList.toggle('active');
		});
	
		closeButton.addEventListener('click', function () {
			sidebar.classList.remove('active');
		});
	
		document.addEventListener('click', function (e) {
			if (!sidebar.contains(e.target) && !toggleButton.contains(e.target)) {
				sidebar.classList.remove('active');
			}
		});
	});
	
</script>

