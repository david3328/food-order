new Vue({
  el: '#main',
  data: {
    orders: [],
    showModal: false,
    myOrder: {}
  },
  mounted() {
    this.getOrders();
  },
  methods: {
    getOrders() {
      fetch('ajax.php?mode=getOrders')
        .then(res => res.json())
        .then(res => this.orders = res);
    },
    viewOrder(item) {
      this.myOrder = item;
      console.log(item.id);
      let form = `id=${item.id}`;
      console.log(form);
      fetch('ajax.php?mode=getOrder', {
        method: 'post',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: form
      })
        .then(res => res.json())
        .then(res => {
          this.myOrder.details = res;
          this.showModal = true;
        })
    },
    delOrder(item) {
      swal({
        title: 'Estás Seguro?',
        text: `Eliminarás la orden ${item.id} de la mesa ${item.table}`,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, eliminar!',
        cancelButtonText: 'No, cancelar'
      }).then((result) => {
        if (result.value) {
          let form = `id=${this.myOrder.id}`;
          fetch('ajax.php?mode=deleteOrder', {
            method: 'post',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: form
          })
            .then(res => res.json())
            .then(res => {
              swal(
                'Hecho!',
                'Se ha eliminado la orden',
                'success'
              )
              this.showModal = false;
              this.getOrders();
            })
          swal(
            'Eliminado!',
            'Se ha eliminado.',
            'success'
          )
        }
      })
    },
    serviceOrder() {
      let form = `id=${this.myOrder.id}`;
      fetch('ajax.php?mode=serviceOrder', {
        method: 'post',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: form
      })
        .then(res => res.json())
        .then(res => {
          swal(
            'Hecho!',
            'Se ha servido la orden',
            'success'
          )
          this.showModal = false;
          this.getOrders();
        })
    }
  }
})