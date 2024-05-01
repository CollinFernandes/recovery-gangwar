import { ref } from 'vue';

export const isEnvBrowser = !('GetParentResourceName' in window);

export const vw = (i) => `${0.05208 * i}vw`;
export const vh = (i) => `${0.09259259259259259 * i}vh`;
export const vmin = (i) => `${0.09259259259259259 * i}vmin`;
export const addZero = (i) => (i < 10 ? `0${i}` : i);

export async function fetchNui(
	event,
	data,
	mockData,
) {
	if (isEnvBrowser) {
		if (mockData) return mockData;
		return;
	}

	const resourceName = (window).GetParentResourceName
		? (window).GetParentResourceName()
		: 'nui-resource';

	const resp = await fetch(`https://${resourceName}/${event}`, {
		method: 'POST',
		body: JSON.stringify(data),
	});

	return await resp.json();
}

export const addNuiListener = (
	action,
	handler,
) => {
	const savedHandler = ref(null);

	savedHandler.value = handler;

	window.addEventListener(
		'message',
		(event) => {
			const { eventName: eventAction, data } = event.data;

			if (savedHandler.value) {
				if (eventAction === action) savedHandler.value(data);
			}
		},
	);
};

export const useDragScroll = (slider) => {
	let isDown = false;
	let startX;
	let scrollLeft;

	slider.addEventListener('mousedown', (e) => {
		isDown = true;
		startX = e.pageX - slider.offsetLeft;
		scrollLeft = slider.scrollLeft;
	});

	slider.addEventListener('mouseup', () => (isDown = false));
	slider.addEventListener('mouseleave', () => (isDown = false));

	slider.addEventListener('mousemove', (e) => {
		if (!isDown) return;
		e.preventDefault();
		const x = e.pageX - slider.offsetLeft;
		const walk = x - startX;
		slider.scrollLeft = scrollLeft - walk;
	});

	slider.classList.add('scroll-drag');
};