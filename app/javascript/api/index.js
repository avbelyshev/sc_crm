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
    clientsList: () => adapter.get('/staffs/clients'),
    createClient: (params) => adapter.post('/staffs/clients', params)
  },
  clients: {
    user: () => adapter.get('/clients/user')
  }
}

export {
  backend
}
