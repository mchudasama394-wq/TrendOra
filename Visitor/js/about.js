/**
 * TRENDORA LUXURY E-COMMERCE - ABOUT US DEDICATED JAVASCRIPT
 * Handles scroll-triggered fade animations and timeline reveal effects.
 */

document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    // Timeline Scroll Reveal Animation
    const timelineItems = document.querySelectorAll('.timeline-item');

    const revealTimeline = () => {
        const triggerBottom = window.innerHeight * 0.85;

        timelineItems.forEach(item => {
            const itemTop = item.getBoundingClientRect().top;
            if (itemTop < triggerBottom) {
                item.style.opacity = '1';
                item.style.transform = 'translateY(0)';
            }
        });
    };

    // Initial styles for animation
    timelineItems.forEach(item => {
        item.style.opacity = '0';
        item.style.transform = 'translateY(30px)';
        item.style.transition = 'all 0.6s cubic-bezier(0.16, 1, 0.3, 1)';
    });

    window.addEventListener('scroll', revealTimeline, { passive: true });
    revealTimeline(); // Trigger once on load
});
