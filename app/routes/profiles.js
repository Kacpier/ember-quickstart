import Route from '@ember/routing/route';

export default class ProfilesRoute extends Route {
    model(){
        return[
            {
                id: '',
                name:'',
                headline: '',
                location: '',
                about: '',
            },
            {
                id: '',
                name:'',
                headline: '',
                location: '',
                about: '',
            }
        ]
    }
}
