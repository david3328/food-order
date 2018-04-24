new Vue({
  el:'#main',
  data:{
    cart:[],
    table:'',
  },
  computed:{
    getTotal(){
      let total = 0;
      this.cart.forEach(({quantity,price}) => total+=(quantity*price) );
      return total;
    }
  },
  mounted(){
    this.getCart();
  },
  methods:{
    getCart(){
      this.cart = localStorage.getItem('my-food-order')? JSON.parse(localStorage.getItem('my-food-order')):[]
    },
    delItem(item){
      swal({
        title: '¿Estás seguro?',
        text: `Eliminarás el plato ${item.name}`,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, eliminar!',
        cancelButtonText: 'No, cancelar'
      }).then((result) => {
        if (result.value) {
          let i = this.cart.indexOf(item);
          this.cart.splice(i,1);
          localStorage.setItem('my-food-order',JSON.stringify(this.cart));
          swal(
            'Deleted!',
            'Your file has been deleted.',
            'success'
          )
        }
      })
     
    },
    sendOrder(){
      if(!this.table){
        swal(
          'Error',
          'No olvides poner el número de mesa!',
          'error'
        )
      }else{
        if(!this.cart){
          swal(
            'Error',
            'No tienes ordenes para registrar',
            'error'
          )
        }else{
          let form = `details=${JSON.stringify(this.cart)}&total=${this.getTotal}&table=${this.table}`
          fetch('ajax.php?mode=addOrder',{
            method:'post',
            headers:{
              'Content-Type':'application/x-www-form-urlencoded'
            },
            credentials:'include',
            body:form
          })
          .then(res=>res.json())
          .then(res=>{
            if(res===0){
              swal(
                'Error',
                'Los datos deben estar completos',
                'error'
              )
            }else if(res===2){
              swal(
                'Error',
                'Ha ocurrido un error al registrar',
                'error'
              )
            }else{
              swal(
                'Agregado',
                'Se ha orden ha pasado a cocina para ser atendido',
                'success'
              )
              localStorage.removeItem('my-food-order');
              window.location.href = '?view=index';
            }
          })
        }
      }
    }
  }
})
