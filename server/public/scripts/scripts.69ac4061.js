"use strict";var app=angular.module("monApp",["ui.router","ng-token-auth"]);app.config(["$stateProvider","$urlRouterProvider","$authProvider",function(a,b,c){c.configure([{"default":{apiUrl:"https://univ-mon.herokuapp.com",proxyIf:function(){window.isOldIE()}}},{prof:{apiUrl:"https://univ-mon.herokuapp.com",proxyIf:function(){window.isOldIE()},signOutUrl:"/prof_auth/sign_out",emailSignInPath:"/prof_auth/sign_in",emailRegistrationPath:"/prof_auth",accountUpdatePath:"/prof_auth",accountDeletePath:"/prof_auth",passwordResetPath:"/prof_auth/password",passwordUpdatePath:"/prof_auth/password",tokenValidationPath:"/prof_auth/validate_token"}}]),b.otherwise("/login"),a.state("login",{url:"/login",templateUrl:"views/sessions/new.html",controller:"IndexCtrl"}).state("products",{url:"/products",templateUrl:"views/products/index.html",resolve:{auth:["$auth","$state",function(a,b){return a.validateUser().then(function(a){"default"==a.configName&&b.go("not_authorized")})["catch"](function(){b.go("login")})}]},controller:"ProductsCtrl"}).state("courses",{url:"/courses",templateUrl:"views/courses/index.html",resolve:{auth:["$auth","$state",function(a,b){return a.validateUser().then(function(a){"default"==a.configName&&b.go("not_authorized")})["catch"](function(){b.go("login")})}]},controller:"CoursesCtrl"}).state("posts",{url:"/posts",templateUrl:"views/posts/index.html",resolve:{auth:["$auth","$state",function(a,b){return a.validateUser().then(function(a){"prof"==a.configName&&b.go("not_authorized")})["catch"](function(){b.go("login")})}]},controller:"PostsIndexCtrl"}).state("post",{url:"/posts/:id",templateUrl:"views/posts/show.html",resolve:{auth:["$auth","$state",function(a,b){return a.validateUser().then(function(a){"prof"==a.configName&&b.go("not_authorized")})["catch"](function(){b.go("login")})}]},controller:"PostsShowCtrl"}).state("not_authorized",{url:"/not_authorized",templateUrl:"views/not_authorized.html"})}]),app.controller("IndexCtrl",["$scope","$auth","$rootScope","$state",function(a,b,c,d){a.student=!1,a.professor=!1,a.toggleForm=function(b){"student"===b?(a.student=!0,a.professor=!1):(a.student=!1,a.professor=!0)},c.$on("auth:login-success",function(a,b){console.log("Successful login!"),"default"==b.configName?(console.log("Routing to Student access.."),d.go("posts")):"prof"==b.configName&&(console.log("Routing to Professor access.."),d.go("courses"))}),c.$on("auth:login-error",function(b,c){a.errors=c.errors[0]})}]),app.controller("ProductsCtrl",["$scope","$auth","$rootScope","Product",function(a,b,c,d){d.all().then(function(b){a.products=b});var e=function(){console.log(b)};e()}]),app.service("Product",["$http","$auth",function(a,b){this.all=function(){return a.get(b.apiUrl()+"/products")}}]),app.service("Course",["$http","$auth",function(a,b){this.all=function(){return a.get(b.apiUrl()+"/courses")}}]),app.service("Comment",["$http","$auth",function(a,b){this.create=function(c){return a.post(b.apiUrl()+"/comments",{comment:{body:c.comment,post_id:c.post_id}})}}]),app.service("Like",["$http","$auth",function(a,b){this.create=function(c,d){return a.post(b.apiUrl()+"/likes",{like:{likeable_id:c,likeable_type:d}})}}]),app.controller("CoursesCtrl",["$scope","Course",function(a,b){b.all().then(function(b){a.courses=b})}]),app.controller("PostsIndexCtrl",["$scope","Post","$state",function(a,b,c){a.showPostForm=!1,a.postForm={},b.all().then(function(b){a.posts=b.data}),a.readMore=function(a){console.log(a),c.go("post",{id:a})},a.submit=function(){console.log(a.postForm),b.create(a.postForm).then(function(b){a.posts.push(b.data),a.successMessage="Post successfully created!",a.postForm={}})},a.newPost=function(){a.showPostForm=!0}}]),app.controller("PostsShowCtrl",["$scope","Post","$stateParams","Comment","Like",function(a,b,c,d,e){a.commentForm={post_id:c.id},b.get(c.id).then(function(b){a.post=b.data,a.comments=a.post.comments,a.comments_count=a.post.comments_count,a.likes=a.post.likes,a.likes_count=a.post.likes_count}),a.like=function(b,c){e.create(b,c).then(function(b){a.message="Liked "+b.data.likeable_type+"!"})},a.submit=function(){d.create(a.commentForm).then(function(b){a.comments.push(b.data),a.post.comments_count+=1,a.message="Thanks for comment!"}),a.commentForm.comment=null}}]),app.service("Post",["$http","$auth",function(a,b){this.all=function(){return a.get(b.apiUrl()+"/posts")},this.get=function(c){return a.get(b.apiUrl()+"/posts/"+c)},this.create=function(c){return a.post(b.apiUrl()+"/posts",{post:{body:c.body,title:c.title}})}}]);