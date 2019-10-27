import axios from 'axios'

const token = document.head.querySelector('meta[name="csrf-token"]')

const adapter = axios.create({
  baseURL: '/',
  headers: {
    'Accept': 'application/json',
    'X-CSRF-TOKEN': token.content
  }
})

const backend = {
  staffs: {
    user: () => adapter.get('/staffs/user'),
    index: () => adapter.get('/staffs/staffs'),
    create: (params) => adapter.post('/staffs/staffs', params),
    edit: (id) => adapter.get(`/staffs/staffs/${id}/edit`),
    update: (id, params) => adapter.patch(`/staffs/staffs/${id}`, params),
    destroy: (id) => adapter.delete(`/staffs/staffs/${id}`),
  },
  clients: {
    user: () => adapter.get('/clients/user'),
    index: () => adapter.get('/staffs/clients'),
    create: (params) => adapter.post('/staffs/clients', params),
    edit: (id) => adapter.get(`/staffs/clients/${id}/edit`),
    update: (id, params) => adapter.patch(`/staffs/clients/${id}`, params),
    destroy: (id) => adapter.delete(`/staffs/clients/${id}`),
  },
  organizations: {
    index: () => adapter.get('/staffs/organizations'),
    create: (params) => adapter.post('/staffs/organizations', params),
    edit: (id) => adapter.get(`/staffs/organizations/${id}/edit`),
    update: (id, params) => adapter.patch(`/staffs/organizations/${id}`, params),
    destroy: (id) => adapter.delete(`/staffs/organizations/${id}`),
    legal_forms: () => adapter.get('/staffs/organizations/legal_forms'),
  },
  equipments: {
    index: () => adapter.get('/staffs/equipments'),
    create: (params) => adapter.post('/staffs/equipments', params),
    edit: (id) => adapter.get(`/staffs/equipments/${id}/edit`),
    update: (id, params) => adapter.patch(`/staffs/equipments/${id}`, params),
    destroy: (id) => adapter.delete(`/staffs/equipments/${id}`),
    kinds: () => adapter.get('/staffs/equipments/kinds'),
  }
}

export {
  backend
}
