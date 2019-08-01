<template>
	<div class="container" id="app">
		<div class="row justify-content-center">
	     <div class="col-md-12">
	     	<div class="card card-default">
	     		<div class="card-header">
	     			File Upload Component
	     		</div>

	     		<div class="card-body">
	     		  <div class="row">
	     		  	<div class="col-md-3" v-if="image">
	     		  		<img :src="image" class="img-responsive" height="70" width="90">
	     		  	</div>
	     			<div class="col-md-6">
	     				<input type="file" v-on:change="onImageChange" class="form-controm">
	     			</div>

	     			<div class="col-md-3">
	     				<button class="btn btn-success btn-block" @click="uploadImage">Upload</button>
	     			</div>
	     		  </div>
	     		</div>
	     	</div>
	     	<div class="card card-default">
	     		<div class="card-header">
	     			Files
	     		</div>

	     		<div class="card-body" style="padding: 20px;">
	     		  <div class="row">
	     		  	 <div class="col-sm-3" v-for="myFile in myFiles" :key="myFile.id">
	     		  	 	<button type="button" class="btn btn-success" v-on:click="fDownload(myFile.image_name)">
	     		  	 		<i class="fa fa-download"></i>
	     		  	 	   {{myFile.image_name}}
	     		  	    </button>
	     		  	 </div>
	     		  </div>
	     		</div>
	     	</div>
	     </div>
		</div>
	</div>
</template>

<script>
	export default{
		data(){
			return{
				image:'',
				myFiles: {}
			}
		},

		methods:{
			onImageChange(e){
				let files = e.target.files || e.dataTransfer.files;
				if(!files.length)
					return;
				this.createImage(files[0]);
			},
			createImage(file){
				let reader = new FileReader();
				let vm = this;
				reader.onload = (e) =>{
					vm.image = e.target.result;
				};
				reader.readAsDataURL(file);
			},
			uploadImage(){
				axios.post('/image/store', {image: this.image}).then(response =>{
					if(response.data.success){
						aler(response.data.success);
					}
				});
			},
			getFiles(){
				axios.get('/api/files').then(response => {this.myFiles = response.data['files']});
			},
			fDownload(fileName){
				axios.get('/api/download/' + fileName);
			}
		},
		created() {
            this.getFiles();
        }
	}
</script>

<style scoped>
	.card
	{
		margin: 150px autu;
	}
</style>