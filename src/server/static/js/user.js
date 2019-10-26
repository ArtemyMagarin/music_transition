var user = JSON.parse(window.localStorage.getItem('userData'));
console.log(user)


function getAvatarUrl() {
	return 'https://avatars.yandex.net/get-yapic/'+user.default_avatar_id+'/islands-200'
}