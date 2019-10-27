import Vue from 'vue'

import iconSet from 'quasar/icon-set/fontawesome-v5.js'
import '@quasar/extras/fontawesome-v5/fontawesome-v5.css'

import '../assets/styles/quasar.styl'
import 'quasar/dist/quasar.ie.polyfills'

import {
    Quasar,
    QLayout,
    QHeader,
    QDrawer,
    QDialog,
    QPageContainer,
    QPage,
    QToolbar,
    QToolbarTitle,
    QBtn,
    QSpace,
    QTable,
    QTr,
    QTd,
    QTabs,
    QTab,
    QForm,
    QInput,
    QScrollArea,
    QList,
    QItem,
    QItemSection,
    QSelect,
    QSeparator,
    QSpinnerHourglass,
    QCard,
    QCardSection,
    QCardActions,
    ClosePopup
} from 'quasar'

Vue.use(Quasar, {
    config: {},
    components: {
        QLayout,
        QHeader,
        QDrawer,
        QDialog,
        QPageContainer,
        QPage,
        QToolbar,
        QToolbarTitle,
        QBtn,
        QSpace,
        QTable,
        QTr,
        QTd,
        QTabs,
        QTab,
        QForm,
        QInput,
        QScrollArea,
        QList,
        QItem,
        QItemSection,
        QSelect,
        QSeparator,
        QSpinnerHourglass,
        QCard,
        QCardSection,
        QCardActions
    },
    directives: {
        ClosePopup
    },
    iconSet: iconSet,
    plugins: {
    }
})
