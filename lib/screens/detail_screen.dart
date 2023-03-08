import 'package:flutter/material.dart';
import 'package:yofopelis/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO Cambiar luego por una instancia de movie

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards(),
            ]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              'https://www.ctilogistics.com/wp-content/uploads/2012/10/500x3004.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            // Crea un widget de una card con estilo redondeado
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(
                  'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALcAAAETCAMAAABDSmfhAAAANlBMVEXMzMzLy8uUlJTIyMjPz8+ampqbm5uXl5ejo6PFxcW+vr6enp6mpqasrKyvr6+pqam4uLi0tLSfTpDKAAACSElEQVR4nO3W3W7bMAyGYYn6l2xLvv+bHekkW7Id9GjzgL4PWlRQ1OILQ1N1DgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC+o9BXi49Ff+10/3EktvXc8a8z/vcz/1qrIsXCdF0clqVtInt4P9NFZLMdP3RhO17PjDuDx0OOJTk6f5SziobzS44p/f1MlXOWdR1+Ls5y7HLG22I7N6XFVLzWfQvLMoVZW0/nWzHjyLFbylhLbLLrYi/NSb0xt99HiyVrL4zd97Jrm4wt9DG18m1535seWl1zH9GFMZy3uH7L+lvpznq35pts0fV8+J7mldtbdo1bjpUfhW9nWVFfqs6Xqp/JNkLM6cbYzprVeqCnQ7/1oWtZc9equcNe0rR6u1CzLVrW3KlaU9UQR7p3ovhRNGQvh2tJe6Cl+cztTinXhNEGSTZh9C1Z7vDKHb74y39VXPakWb39r3oPy61ts+dlwX3brz551TvUcXu9fRXrhff+Do/+bkcLpw1Ee1uyW9n/n/6Oq0z7aSPEekVrWZ/zxNk015pqeBt/1lHZBXuI/ZZ0now754nfSovRbskaTrtugk7GXtZbD4QyH3MwbuIei0NakHln7p7znNbgp2zZ7ku3pI7P+zLJHOm6JmUb1z8FK9Uq66bIxs9SitgNYlPvShuO8lFu/Sz0xGmLuEu5bne96K3uN4qXa+WfQeL19XEoPHd+vvTnGQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD4Pn4ATIYRvDLVvEgAAAAASUVORK5CYII='),
              height: 150,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movie.title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Movie.originalTitle',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    'movie.voteAverage',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          'Laboris irure magna laborum nulla fugiat magna labore. Lorem laborum minim esse cillum quis cupidatat excepteur Lorem consectetur aliquip irure deserunt. Ipsum nostrud ea commodo duis mollit quis aliquip amet eiusmod ad ea labore excepteur duis. Cillum ullamco sit sunt nisi aliquip anim aliqua dolor deserunt proident quis nulla.',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.subtitle1,
        ));
  }
}
