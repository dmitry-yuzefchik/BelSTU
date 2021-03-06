import { action } from 'mobx';
import UserStore from './userStore';
import SnackbarStore from './snackbarStore';
import ModalStore from './modalStore';
import NotificationStore from './notificationStore';
import ProjectStore from './projectStore';
import BoardStore from './boardStore';
import TaskStore from './taskStore';

class RootStore {
    constructor() {
        this.snackbarStore = new SnackbarStore(this);
        this.userStore = new UserStore(this);
        this.modalStore = new ModalStore(this);
        this.notificationStore = new NotificationStore(this);
        this.projectStore = new ProjectStore(this);
        this.boardStore = new BoardStore(this);
        this.taskStore = new TaskStore(this);
    }

    @action async fetchUserData() {
        await this.userStore.checkAuth();

        if (!this.userStore.user.isLoggedIn) return;

        await Promise.all([
            this.userStore.getProfile(),
            this.userStore.getSettings(),
            this.notificationStore.getNotifcations()
        ]);
    }
}

export default RootStore;