// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CharacterDao? _characterDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Character` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `picture` TEXT NOT NULL, `sexe` TEXT NOT NULL, `origin` TEXT NOT NULL, `inventory` TEXT NOT NULL, `logs` TEXT NOT NULL, `age` INTEGER NOT NULL, `level` INTEGER NOT NULL, `attribute` INTEGER NOT NULL, `mainSpe` INTEGER NOT NULL, `secondSpe` INTEGER NOT NULL, `mainElement` INTEGER NOT NULL, `secondElement` INTEGER NOT NULL, `kekkaiGenkai` INTEGER NOT NULL, `pointsLeftToSpend` INTEGER NOT NULL, `hpMax` INTEGER NOT NULL, `hp` INTEGER NOT NULL, `constitution` INTEGER NOT NULL, `ninjutsu` INTEGER NOT NULL, `taijutsu` INTEGER NOT NULL, `genjutsu` INTEGER NOT NULL, `luck` INTEGER NOT NULL, `perception` INTEGER NOT NULL,`chakraMax` INTEGER NOT NULL, `chakra` INTEGER NOT NULL, `dodge` INTEGER NOT NULL, `throwing` INTEGER NOT NULL, `hpBuffer` INTEGER NOT NULL, `constitutionBuffer` INTEGER NOT NULL, `ninjutsuBuffer` INTEGER NOT NULL, `taijutsuBuffer` INTEGER NOT NULL, `genjutsuBuffer` INTEGER NOT NULL, `luckBuffer` INTEGER NOT NULL, `perceptionBuffer` INTEGER NOT NULL, `chakraBuffer` INTEGER NOT NULL, `dodgeBuffer` INTEGER NOT NULL, `throwingBuffer` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CharacterDao get characterDao {
    return _characterDaoInstance ??= _$CharacterDao(database, changeListener);
  }
}

class _$CharacterDao extends CharacterDao {
  _$CharacterDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _characterInsertionAdapter = InsertionAdapter(
            database,
            'Character',
            (Character item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'picture': item.picture,
                  'sexe': item.sexe,
                  'origin': item.origin,
                  'inventory': item.inventory,
                  'logs': item.logs,
                  'age': item.age,
                  'level': item.level,
                  'attribute': item.attribute,
                  'mainSpe': item.mainSpe,
                  'secondSpe': item.secondSpe,
                  'mainElement': item.mainElement,
                  'secondElement': item.secondElement,
                  'kekkaiGenkai': item.kekkaiGenkai,
                  'pointsLeftToSpend': item.pointsLeftToSpend,
                  'hpMax': item.hpMax,
                  'hp': item.hp,
                  'constitution': item.constitution,
                  'ninjutsu': item.ninjutsu,
                  'taijutsu': item.taijutsu,
                  'genjutsu': item.genjutsu,
                  'luck': item.luck,
                  'perception': item.perception,
                  'chakraMax': item.chakraMax,
                  'chakra': item.chakra,
                  'dodge': item.dodge,
                  'throwing': item.throwing,
                  'hpBuffer': item.hpBuffer,
                  'constitutionBuffer': item.constitutionBuffer,
                  'ninjutsuBuffer': item.ninjutsuBuffer,
                  'taijutsuBuffer': item.taijutsuBuffer,
                  'genjutsuBuffer': item.genjutsuBuffer,
                  'luckBuffer': item.luckBuffer,
                  'perceptionBuffer': item.perceptionBuffer,
                  'chakraBuffer': item.chakraBuffer,
                  'dodgeBuffer': item.dodgeBuffer,
                  'throwingBuffer': item.throwingBuffer
                }),
        _characterUpdateAdapter = UpdateAdapter(
            database,
            'Character',
            ['id'],
            (Character item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'picture': item.picture,
                  'sexe': item.sexe,
                  'origin': item.origin,
                  'inventory': item.inventory,
                  'logs': item.logs,
                  'age': item.age,
                  'level': item.level,
                  'attribute': item.attribute,
                  'mainSpe': item.mainSpe,
                  'secondSpe': item.secondSpe,
                  'mainElement': item.mainElement,
                  'secondElement': item.secondElement,
                  'kekkaiGenkai': item.kekkaiGenkai,
                  'pointsLeftToSpend': item.pointsLeftToSpend,
                  'hpMax': item.hpMax,
                  'hp': item.hp,
                  'constitution': item.constitution,
                  'ninjutsu': item.ninjutsu,
                  'taijutsu': item.taijutsu,
                  'genjutsu': item.genjutsu,
                  'luck': item.luck,
                  'perception': item.perception,
                  'chakraMax': item.chakraMax,
                  'chakra': item.chakra,
                  'dodge': item.dodge,
                  'throwing': item.throwing,
                  'hpBuffer': item.hpBuffer,
                  'constitutionBuffer': item.constitutionBuffer,
                  'ninjutsuBuffer': item.ninjutsuBuffer,
                  'taijutsuBuffer': item.taijutsuBuffer,
                  'genjutsuBuffer': item.genjutsuBuffer,
                  'luckBuffer': item.luckBuffer,
                  'perceptionBuffer': item.perceptionBuffer,
                  'chakraBuffer': item.chakraBuffer,
                  'dodgeBuffer': item.dodgeBuffer,
                  'throwingBuffer': item.throwingBuffer
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Character> _characterInsertionAdapter;

  final UpdateAdapter<Character> _characterUpdateAdapter;

  @override
  Future<List<Character>> findAllCharacters() async {
    return _queryAdapter.queryList('SELECT * FROM Character',
        mapper: (Map<String, Object?> row) => Character(
            id: row['id'] as int,
            name: row['name'] as String,
            picture: row['picture'] as String,
            sexe: row['sexe'] as String,
            age: row['age'] as int,
            inventory: row['inventory'] as String,
            logs: row['logs'] as String,
            origin: row['origin'] as String,
            mainSpe: row['mainSpe'] as int,
            secondSpe: row['secondSpe'] as int,
            mainElement: row['mainElement'] as int,
            secondElement: row['secondElement'] as int,
            kekkaiGenkai: row['kekkaiGenkai'] as int,
            level: row['level'] as int,
            attribute: row['attribute'] as int,
            pointsLeftToSpend: row['pointsLeftToSpend'] as int,
            hpMax: row['hpMax'] as int,
            hp: row['hp'] as int,
            constitution: row['constitution'] as int,
            ninjutsu: row['ninjutsu'] as int,
            taijutsu: row['taijutsu'] as int,
            genjutsu: row['genjutsu'] as int,
            luck: row['luck'] as int,
            perception: row['perception'] as int,
            chakraMax: row['chakraMax'] as int,
            chakra: row['chakra'] as int,
            dodge: row['dodge'] as int,
            throwing: row['throwing'] as int,
            hpBuffer: row['hpBuffer'] as int,
            constitutionBuffer: row['constitutionBuffer'] as int,
            ninjutsuBuffer: row['ninjutsuBuffer'] as int,
            taijutsuBuffer: row['taijutsuBuffer'] as int,
            genjutsuBuffer: row['genjutsuBuffer'] as int,
            luckBuffer: row['luckBuffer'] as int,
            perceptionBuffer: row['perceptionBuffer'] as int,
            chakraBuffer: row['chakraBuffer'] as int,
            dodgeBuffer: row['dodgeBuffer'] as int,
            throwingBuffer: row['throwingBuffer'] as int));
  }

  @override
  Future<Character?> findCharacterById(int id) async {
    return _queryAdapter.query('SELECT * FROM Character WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Character(
            id: row['id'] as int,
            name: row['name'] as String,
            picture: row['picture'] as String,
            sexe: row['sexe'] as String,
            age: row['age'] as int,
            inventory: row['inventory'] as String,
            logs: row['logs'] as String,
            origin: row['origin'] as String,
            mainSpe: row['mainSpe'] as int,
            secondSpe: row['secondSpe'] as int,
            mainElement: row['mainElement'] as int,
            secondElement: row['secondElement'] as int,
            kekkaiGenkai: row['kekkaiGenkai'] as int,
            level: row['level'] as int,
            attribute: row['attribute'] as int,
            pointsLeftToSpend: row['pointsLeftToSpend'] as int,
            hpMax: row['hpMax'] as int,
            hp: row['hp'] as int,
            constitution: row['constitution'] as int,
            ninjutsu: row['ninjutsu'] as int,
            taijutsu: row['taijutsu'] as int,
            genjutsu: row['genjutsu'] as int,
            luck: row['luck'] as int,
            perception: row['perception'] as int,
            chakraMax: row['chakraMax'] as int,
            chakra: row['chakra'] as int,
            dodge: row['dodge'] as int,
            throwing: row['throwing'] as int,
            hpBuffer: row['hpBuffer'] as int,
            constitutionBuffer: row['constitutionBuffer'] as int,
            ninjutsuBuffer: row['ninjutsuBuffer'] as int,
            taijutsuBuffer: row['taijutsuBuffer'] as int,
            genjutsuBuffer: row['genjutsuBuffer'] as int,
            luckBuffer: row['luckBuffer'] as int,
            perceptionBuffer: row['perceptionBuffer'] as int,
            chakraBuffer: row['chakraBuffer'] as int,
            dodgeBuffer: row['dodgeBuffer'] as int,
            throwingBuffer: row['throwingBuffer'] as int),
        arguments: [id]);
  }

  @override
  Future<Character?> findCharacterByName(String name) async {
    return _queryAdapter.query('SELECT * FROM Character WHERE name = ?1',
        mapper: (Map<String, Object?> row) => Character(
            id: row['id'] as int,
            name: row['name'] as String,
            picture: row['picture'] as String,
            sexe: row['sexe'] as String,
            age: row['age'] as int,
            inventory: row['inventory'] as String,
            logs: row['logs'] as String,
            origin: row['origin'] as String,
            mainSpe: row['mainSpe'] as int,
            secondSpe: row['secondSpe'] as int,
            mainElement: row['mainElement'] as int,
            secondElement: row['secondElement'] as int,
            kekkaiGenkai: row['kekkaiGenkai'] as int,
            level: row['level'] as int,
            attribute: row['attribute'] as int,
            pointsLeftToSpend: row['pointsLeftToSpend'] as int,
            hpMax: row['hpMax'] as int,
            hp: row['hp'] as int,
            constitution: row['constitution'] as int,
            ninjutsu: row['ninjutsu'] as int,
            taijutsu: row['taijutsu'] as int,
            genjutsu: row['genjutsu'] as int,
            luck: row['luck'] as int,
            perception: row['perception'] as int,
            chakraMax: row['chakraMax'] as int,
            chakra: row['chakra'] as int,
            dodge: row['dodge'] as int,
            throwing: row['throwing'] as int,
            hpBuffer: row['hpBuffer'] as int,
            constitutionBuffer: row['constitutionBuffer'] as int,
            ninjutsuBuffer: row['ninjutsuBuffer'] as int,
            taijutsuBuffer: row['taijutsuBuffer'] as int,
            genjutsuBuffer: row['genjutsuBuffer'] as int,
            luckBuffer: row['luckBuffer'] as int,
            perceptionBuffer: row['perceptionBuffer'] as int,
            chakraBuffer: row['chakraBuffer'] as int,
            dodgeBuffer: row['dodgeBuffer'] as int,
            throwingBuffer: row['throwingBuffer'] as int),
        arguments: [name]);
  }

  @override
  Future<void> insertCharacter(Character character) async {
    await _characterInsertionAdapter.insert(
        character, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCharacter(Character character) async {
    await _characterUpdateAdapter.update(character, OnConflictStrategy.abort);
  }
}
