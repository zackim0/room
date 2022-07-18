<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String webAppName = "room"; %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="/room/home">우리들의 자취방 생활</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                               <!--  <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> Vincent Gabriel <i class="caret"></i> -->
								
								<c:choose>
								<c:when test="${ empty loginuser }">
								<li><a href="/room/account/login">로그인</a></li>
								<li><a href="/room/account/register">회원가입</a></li>
								</c:when>
								<c:otherwise>		
								 <a role="button" class="dropdown-toggle" data-toggle="dropdown"> ${ loginuser.memberId }님 반갑습니다 <i class="caret"></i>													
									<ul class="dropdown-menu">								
                                    <li>
                                        <a tabindex="-1" href="/room/account/profile">마이페이지</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="/room/account/logout">로그아웃</a>
                                    </li>
                                </ul>
            					</c:otherwise>
        					    </c:choose>
                                
                            </li>
                        </ul>
                        <ul class="nav">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">자취 메이트 <i class="caret"></i>
                                
                                </a>
                                <ul class="dropdown-menu" id="menu1">
                                    <li>
                                        <a href="/room/mate-board/list">룸메이트 구하기</a>
                                    </li>
                                    <li>
                                        <a href="/room/petboard/list">산책메이트 구하기</a>
                                    </li>
                                    <li class="divider"></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">자취 요리 <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu" id="menu2">
                                    <li>
                                        <a href="/room/board/cooklist">레시피 공유</a>
                                    </li>
                                    <li>
                                        <a href="#">가전(조리도구) 거래</a>
                                    </li>
                                    <li class="divider"></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">자취 놀이터 <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu" id="menu3">
                                    <li>
                                        <a tabindex="-1" href="/room/playground/gameintroduce/list">추천 게임</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="/room/playground/recrult/list">만나서 놀 사람</a>
                                    </li>
                                    <li class="divider"></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">자취 미용/패션 <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu" id="menu4">
                                    <li>
                                        <a tabindex="-1" href="#">미용실 후기/추천</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="/room/fashion-board/list">의류/화장품 세일 정보</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">자취 꿑팁 <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu" id="menu5">
                                    <li>
                                        <a tabindex="-1" href="#">초기 생활 TIP </a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">부동산 관련 TIP </a>
                                    </li>
                                    <li class="divider"></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>