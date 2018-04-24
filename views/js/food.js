new Vue({
  el:'#main',
  data:{
    foods:[],
    searchFood:''
  },
  mounted(){
    this.getFood();
  },
  computed:{
    myFood(){
      return this.foods.filter(item=>item.name.includes(this.searchFood));
    }
  },
  methods:{
    getFood(){
      fetch('ajax.php?mode=getFood')
      .then(res=>res.json())
      .then(res=>this.foods=res)
    },
    addFood(item){
      item.quantity = item.quantity? item.quantity : 1;
      let myFood = localStorage.getItem('my-food-order')? JSON.parse(localStorage.getItem('my-food-order')) : [];
      let food = myFood.find(el=>el.id===item.id);
      item.quantity = food? (parseInt(item.quantity)+parseInt(food.quantity)) : parseInt(item.quantity);
      if(!food) myFood.push(item) 
      else {
        let i = myFood.indexOf(food);
        myFood[i] = item;
      }
      localStorage.setItem('my-food-order',JSON.stringify(myFood));
      swal(
        'Agregado!',
        `Ahora tienes ${item.quantity} plato(s) de ${item.name} en tu orden.`,
        'success'
      )
      item.quantity = null;
    }
  }
})