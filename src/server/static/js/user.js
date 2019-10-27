var user = JSON.parse(window.localStorage.getItem('userData'));
console.log(user)


function getAvatarUrl() {
	return 'https://avatars.yandex.net/get-yapic/'+user.default_avatar_id+'/islands-200'
}

function setupAvatar() {
	[...document.querySelectorAll('.personal_image')].map(item => item.src = getAvatarUrl())
}

function setupName() {
	[...document.querySelectorAll('.personal_name')].map(item => item.innerText = user.real_name)
}

setupAvatar()
setupName()
