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
    update: (id, params) => adapter.patch(`/staffs/staffs/${id}`, params),
    destroy: (id) => adapter.delete(`/staffs/staffs/${id}`),
  },
  clients: {
    user: () => adapter.get('/clients/user'),
    index: () => adapter.get('/staffs/clients'),
    create: (params) => adapter.post('/staffs/clients', params),
    update: (id, params) => adapter.patch(`/staffs/clients/${id}`, params),
    destroy: (id) => adapter.delete(`/staffs/clients/${id}`),
  },
  organizations: {
    index: () => adapter.get('/staffs/organizations'),
    create: (params) => adapter.post('/staffs/organizations', params),
    update: (id, params) => adapter.patch(`/staffs/organizations/${id}`, params),
    destroy: (id) => adapter.delete(`/staffs/organizations/${id}`),
    legal_forms: () => adapter.get('/staffs/organizations/legal_forms'),
  }
}

export {
  backend
}
