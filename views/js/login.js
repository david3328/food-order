new Vue({
  el: '#main',
  data:{
    name: '',
    password:''
  },
  methods:{
    logIn(){
      if(this.name && this.password){
        let form = `name=${this.name}&password=${this.password}`;
        fetch('ajax.php?mode=login',{
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
              'Falta usuario y/o contraseña',
              'error'
            )
          }else if(res===2){
            swal(
              'Error',
              'usuario o contraseña incorrecta',
              'error'
            )
          }else{
            location.reload();
          }
        })
      }else{
        swal(
          'Error',
          'Falta usuario y/o contraseña',
          'error'
        )
      }
    }
  }
})