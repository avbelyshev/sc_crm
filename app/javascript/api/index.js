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
  user: (url) => adapter.get(url)
};

export {
  backend
}
