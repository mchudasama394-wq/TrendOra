document.addEventListener('DOMContentLoaded', function () {
	var panel = document.getElementById('productPanel');
	var categoryPanel = document.getElementById('categoryPanel');
	var backdrop = document.getElementById('panelBackdrop');
	var search = document.getElementById('productSearch');
	var category = document.getElementById('categoryFilter');
	var rows = Array.prototype.slice.call(document.querySelectorAll('#productsBody tr'));
	var count = document.getElementById('resultCount');
	var empty = document.getElementById('emptyState');
	var imageInput = document.getElementById('fuProductImage');
	var imagePreview = document.getElementById('productImagePreview');
	var uploadArea = document.getElementById('productUploadArea');

	function togglePanel(open) {
		panel.classList.toggle('open', open);
		panel.setAttribute('aria-hidden', open ? 'false' : 'true');
		backdrop.hidden = !open;
		document.body.style.overflow = open ? 'hidden' : '';
	}

	function toggleCategoryPanel(open) {
		categoryPanel.classList.toggle('open', open);
		categoryPanel.setAttribute('aria-hidden', open ? 'false' : 'true');
		backdrop.hidden = !open;
		document.body.style.overflow = open ? 'hidden' : '';
	}

	document.getElementById('openProductPanel').addEventListener('click', function () { togglePanel(true); });
	document.getElementById('closeProductPanel').addEventListener('click', function () { togglePanel(false); });
	document.getElementById('cancelProduct').addEventListener('click', function () { togglePanel(false); });
	document.getElementById('openCategoryPanel').addEventListener('click', function () { toggleCategoryPanel(true); });
	document.getElementById('closeCategoryPanel').addEventListener('click', function () { toggleCategoryPanel(false); });
	document.getElementById('cancelCategory').addEventListener('click', function () { toggleCategoryPanel(false); });
	backdrop.addEventListener('click', function () { togglePanel(false); });
	document.addEventListener('keydown', function (event) { if (event.key === 'Escape') { togglePanel(false); toggleCategoryPanel(false); } });
	var categoryMessage = document.getElementById('lblCategoryMessage');
	if (categoryMessage && categoryMessage.textContent.trim()) toggleCategoryPanel(true);
	var productMessage = document.getElementById('lblProductMessage');
	if (productMessage && productMessage.textContent.trim()) togglePanel(true);
	var productId = document.getElementById('hfProductId');
	if (productId && productId.value) togglePanel(true);

	if (imageInput) {
		imageInput.setAttribute('accept', 'image/png,image/jpeg,image/webp');
		imageInput.addEventListener('change', function () {
			var file = imageInput.files[0];
			if (!file) return;
			imagePreview.src = URL.createObjectURL(file);
			imagePreview.hidden = false;
			uploadArea.classList.add('has-preview');
		});
	}

	function filterProducts() {
		var query = search.value.toLowerCase().trim();
		var selectedCategory = category.value;
		var visible = 0;
		rows.forEach(function (row) {
			var matchesName = row.getAttribute('data-name').toLowerCase().indexOf(query) !== -1;
			var matchesCategory = selectedCategory === 'all' || row.getAttribute('data-category') === selectedCategory;
			var show = matchesName && matchesCategory;
			row.hidden = !show;
			if (show) visible++;
		});
		count.textContent = 'Showing ' + visible + ' of ' + rows.length + ' products';
		empty.hidden = visible !== 0;
	}

	search.addEventListener('input', filterProducts);
	category.addEventListener('change', filterProducts);
	filterProducts();
});
