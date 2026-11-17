document.querySelectorAll('[data-home-tab]').forEach((button) => {
  button.addEventListener('click', () => {
    const selectedPanelId = button.dataset.homeTab;

    document.querySelectorAll('[data-home-tab]').forEach((tab) => {
      const isSelected = tab === button;
      tab.classList.toggle('site-navigation__link--active', isSelected);
      tab.setAttribute('aria-selected', isSelected);
    });

    document.querySelectorAll('.home-content__panel').forEach((panel) => {
      panel.hidden = panel.id !== selectedPanelId;
    });
  });
});
